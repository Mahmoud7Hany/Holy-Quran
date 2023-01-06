import 'package:flutter/material.dart';
import 'package:quran_kareem/arabic_surah_number.dart';
import 'package:quran_kareem/my_drawer.dart';
import 'main.dart';
import 'surah_builder.dart';
import 'constant.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
// دي الصفحه الرائسيه الي هيفتح فيها التطبيق اول ما يفتح
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'انتقل إلى المرجعية',
        child: const Icon(Icons.bookmark),
        backgroundColor: Colors.green,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookMark() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurahBuilder(
                  arabic: quran[0],
                  surah: bookMarkedSurah - 1,
                  surahName: arabicName[bookMarkedSurah - 1]['name'],
                  ayah: bookMarkedAyah,
                ),
              ),
            );
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          //"القرآن",
          "القرآن الكريم",
          style: TextStyle(
            fontFamily: 'OttomanHafs',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 56, 115, 59),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSurahNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black87,
                          fontFamily: 'OttomanHafs',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                        arabic: quran[0],
                        surah: i,
                        surahName: arabicName[i]['name'],
                        ayah: 0,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
