import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pengajuan_dokumen/env/color.dart';
import '../login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PengajuanDokumenUser(),
    );
  }
}

class PengajuanDokumenUser extends StatefulWidget {
  @override
  _PengajuanDokumenUserState createState() => _PengajuanDokumenUserState();
}

class _PengajuanDokumenUserState extends State<PengajuanDokumenUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  'Pastikan dokumen-dokumen berikut telah disiapkan.\n'
                  '1. Kartu Tanda Penduduk (KTP) atau Kartu Keluarga.\n'
                  '2. Pas foto terbaru.\n'
                  '3. Surat Keterangan Sehat.\n'
                  '4. Dokumen IPK atau transkrip nilai yang telah dilegalisir.\n'
                  '5. Sertifikat kemampuan bahasa inggris dari ETS, PTE Academic, atau IELTS (Optional).\n'
                  '6. Surat rekomendasi dari tokoh masyarakat atau akademisi.\n'
                  '7. Surat usulan instansi untuk pendaftar dari kalangan CPNS, PNS, TNI, atau POLRI (Optional).\n'
                  '8. Letter of Acceptance (LOA) (optional).\n'
                  '9. Esai komitmen kembali ke Indonesia.\n'
                  'Kirim dokumen-dokumen tersebut dalam bentuk zip agar dapat dikirimkan sekali saja.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  await _pickFile(context);
                },
                icon: Icon(Icons.upload_file),
                label: Text('Pilih File untuk di Upload'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      );   
  }

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null && !filePath.endsWith('.zip')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hanya file dengan ekstensi .zip yang diperbolehkan!')),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File path: $filePath')),
      );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
    }
  }
}

class DrawerControllerStateNotification extends Notification {
  final bool isOpen;

  DrawerControllerStateNotification(this.isOpen);
}