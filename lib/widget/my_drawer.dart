import 'package:flutter/material.dart';
import 'package:quran_kareem/constants/urlApp.dart';
import 'package:quran_kareem/pages/settings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

// Drawer دي صفحه
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/quran.png",
                  height: 80.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "القرآن الكريم",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "إعدادات",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text(
              "شارك التطبيق",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Share.share("تطبيق القرآن الكريم مجانا و بدون انترنت \n $urlApp");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text(
              "قيم التطبيق",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () async {
              if (!await launchUrl(urlApp,
                  //  السطر ده علشان يفتح الرابط خارج التطبيق
                  mode: LaunchMode.externalApplication)) {
                throw 'تعذر الإطلاق $urlApp';
              }
            },
          ),
        ],
      ),
    );
  }
}
