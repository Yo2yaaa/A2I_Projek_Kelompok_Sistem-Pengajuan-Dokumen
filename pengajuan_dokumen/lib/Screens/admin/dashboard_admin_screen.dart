import 'package:flutter/material.dart';
import 'package:pengajuan_dokumen/env/color.dart';
import '../login.dart';
import 'pengajuan_dokumen_admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardAdmin(),
    );
  }
}

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor,
      appBar: AppBar(
        backgroundColor: myCustomColor[400],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Flexible(
                child: Text(
                  'Admin',
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
                      builder: (context) => const DashboardAdmin()),
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
                      builder: (context) => PengajuanDokumenAdminScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.meeting_room_rounded),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
      drawerScrimColor: Color.fromARGB(255, 6, 150, 114).withOpacity(0.8),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang, Admin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      // 'Ini adalah halaman dashboard dari website pengajuan dokumen. '
                      'Silahkan menekan ikon di sudut kiri atas dan memilih menu pengajuan dokumen '
                      'untuk melihat pengajuan dokumen yang telah dilakukan oleh mahasiswa.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
