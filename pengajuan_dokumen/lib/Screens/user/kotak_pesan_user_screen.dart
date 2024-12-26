import 'package:flutter/material.dart';
import '../../env/color.dart';
import '../login.dart';
import 'dashboard_user_screen.dart';
import 'pengajuan_dokumen_user_screen.dart';

class KotakPesanUserScreen extends StatefulWidget {
  @override
  _KotakPesanUserScreen createState() => _KotakPesanUserScreen();
}

class _KotakPesanUserScreen extends State<KotakPesanUserScreen> {
  final List<Map<String, String>> items = [
    {
      "nama": "Andini Tidore",
      "npm": "07352211046",
    },
    {
      "nama": "Inda Anwar",
      "npm": "07352211067",
    },
    {
      "nama": "Annisa Sabur",
      "npm": "07352211091",
    },
  ];

  void showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pesan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor,
      appBar: AppBar(
        backgroundColor: myCustomColor[400],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Flexible(
                child: Text(
                  'Mahasiswa',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            // const Spacer(),
            Image.asset(
              '../lib/env/assets/logoUnkhair.png', // Pastikan Anda memiliki logo di folder assets
              height: 40,
            ),
          ],
        ),

        //humberger
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      //drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: MediaQuery.of(context).size.height *
                    0.10, // Tinggi responsif
                color: const Color(0xFF4CAF50),
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF6BD8B8),
                    ),
                    margin: EdgeInsets.zero, // Menghilangkan margin default
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0), // Jarak vertikal teks
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: const Text('Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ))))),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardUser()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_copy_rounded),
              title: const Text('Pengajuan Dokumen'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PengajuanDokumenUser()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.mark_email_unread_rounded),
              title: const Text('Kotak Pesan'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KotakPesanUserScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
      drawerScrimColor: Color.fromARGB(255, 6, 150, 114).withOpacity(0.8),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                onTap: () {
                  showMessage(context,
                      ' ${item['nama']}, Berkas Anda dinyatakan telah sesuai.');
                },
                title: Text(item['nama']!),
                subtitle: Text(item['npm']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
