import 'package:flutter/material.dart';
import 'env/color.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(Pengajuan_Dokumen());
}

class Pengajuan_Dokumen extends StatelessWidget {
  const Pengajuan_Dokumen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengajuan Dokumen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myCustomColor,
      ),
      home: SplashScreen(),
    );
  }
}
