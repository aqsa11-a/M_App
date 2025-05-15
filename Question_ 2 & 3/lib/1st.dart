import 'package:flutter/material.dart';
import 'pak_flag.dart'; // Make sure this exists and exports ImageScreen

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const Color gradientStart = Color(0xFF0A73FF);
  static const Color gradientEnd = Color(0xFF00C853);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        centerTitle: true,
        elevation: 6,
        shadowColor: gradientEnd.withOpacity(0.7),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientStart, gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImageScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.9),
              foregroundColor: gradientStart,
              shadowColor: Colors.black54,
              elevation: 10,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            child: const Text('Open Image'),
          ),
        ),
      ),
    );
  }
}
