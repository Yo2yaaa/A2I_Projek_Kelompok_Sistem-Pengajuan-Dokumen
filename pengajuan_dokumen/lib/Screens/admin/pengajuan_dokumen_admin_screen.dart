import 'package:flutter/material.dart';
import '../../env/color.dart';
import '../login.dart';
import 'dashboard_admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PengajuanDokumenAdminScreen(),
    );
  }
}

class PengajuanDokumenAdminScreen extends StatefulWidget {
  const PengajuanDokumenAdminScreen({super.key});

  @override
  _PengajuanDokumenAdminScreen createState() => _PengajuanDokumenAdminScreen();
}

class _PengajuanDokumenAdminScreen extends State<PengajuanDokumenAdminScreen> {
  final List<Map<String, dynamic>> mahasiswa = [
    {"nama": "Andini Tidore", "npm": "07352211046", "isDownloaded": false},
    {"nama": "Inda Anwar", "npm": "07352211067", "isDownloaded": false},
    {"nama": "Annisa Sabur", "npm": "07352211091", "isDownloaded": false},
  ];

  void _showInputDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const Text('Masukkan Komentar'),
          content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200, // Tinggi dialog
          child: Column(
            children: [
              // const Text(
              //   'Masukkan komentar Anda di bawah ini:',
              //   style: TextStyle(fontSize: 14),
              // ),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                maxLength: 292, // Batas karakter
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Komentar Anda...',
                  counterText: '', // Menghilangkan indikator jumlah karakter
                ),
                maxLines: 5, // Mengatur tinggi teks area
              ),
            ],
          ),
        ),
  
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Menutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                String inputText = controller.text;
                // Menangani input string, misalnya menampilkan pesan pakai snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Komentar: $inputText')),
                );
                Navigator.of(context).pop();  // Menutup dialog
              },
              child: const Text('Kirim'),
            ),
          ],
        );
      },
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
              const Expanded(
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
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )),

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
              leading: const Icon(Icons.file_copy),
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
          itemCount: mahasiswa.length,
          itemBuilder: (context, index) {
            final item = mahasiswa[index];
            return Stack(
              clipBehavior:
                  Clip.none, // Memungkinkan elemen keluar dari batas Stack
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nama dan NPM
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['nama'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['npm'],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        // Tombol Unduh
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              mahasiswa[index]['isDownloaded'] = true;
                            });
                          },
                        ),
                        // Tombol Sesuai
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Aksi tombol Sesuai
                          },
                          child: const Text('Sesuai'),
                        ),

                        const SizedBox(width: 8),
                        // Tombol Tidak Sesuai
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Aksi tombol Tidak Sesuai
                            _showInputDialog(context);
                          },
                          child: const Text('Tidak Sesuai'),
                        ),
                      ],
                    ),
                  ),
                ),

                // Lingkaran Hijau
                // if (!item['isDownloaded'])
                //   Positioned(
                //     top: -10,
                //     right: -10,
                //     child: Container(
                //       width: 25,
                //       height: 25,
                //       decoration: BoxDecoration(
                //         color: Colors.greenAccent,
                //         shape: BoxShape.circle,
                //         border: Border.all(color: Colors.white, width: 2),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.2),
                //             blurRadius: 4,
                //             offset: const Offset(0, 2),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
              ],
            );
          },
        ),
      ),
    );
  }
}
