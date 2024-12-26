import 'package:flutter/material.dart';
import '../env/color.dart';
import 'admin/dashboard_admin_screen.dart';
import 'user/dashboard_user_screen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Data login (hardcoded untuk keperluan demo)
  final Map<String, String> adminCredentials = {
    'ks123': 'adminpass', // Kode Staff dan Password untuk Admin
  };

  final Map<String, String> userCredentials = {
    'mhs123': 'mhspass', // NPM dan Password untuk User
  };

  void handleLogin(BuildContext context) {
    String enteredCode = codeController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (adminCredentials.containsKey(enteredCode) &&
        adminCredentials[enteredCode] == enteredPassword) {
      // Jika Admin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardAdmin ()),
      );
    } else if (userCredentials.containsKey(enteredCode) &&
        userCredentials[enteredCode] == enteredPassword) {
      // Jika User
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardUser()),
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('NPM/Kode Staff atau Password salah!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor[900],
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                 const CircleAvatar(
                  radius: 48,
                  
                  backgroundImage: AssetImage('../lib/env/assets/logoUnkhair.png'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
                const Text(
                      'Sistem Pengajuan Dokumen Beasiswa',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                const SizedBox(height: 50),
                // Input NPM/Kode Staff
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'NPM atau Kode Staff',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Input password
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Tombol login
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => handleLogin(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myCustomColor[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
