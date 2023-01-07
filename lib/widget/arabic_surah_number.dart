import 'package:flutter/material.dart';
import 'package:quran_kareem/package/arabic_number_converter.dart';

class ArabicSurahNumber extends StatelessWidget {
  const ArabicSurahNumber({Key? key, required this.i}) : super(key: key);
//  صفحه رقم السورة العربية الي هو مكان رقم الايه الي هيا العلامه الفاصل بين الايات
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E${(i + 1).toString().toArabicNumbers}\uFD3F",
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: "me_quran",
        fontSize: 20.0,
        shadows: [
          Shadow(
            color: Colors.amberAccent,
            offset: Offset(0.5, 0.5),
            blurRadius: 1.0,
          ),
        ],
      ),
    );
  }
}
