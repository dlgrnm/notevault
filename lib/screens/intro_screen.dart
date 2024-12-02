import 'package:flutter/material.dart';
import 'pin_code_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_pattern_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.2),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/intro_screen_illustration.png',
                  height: 400,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome NoteVault',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed risus ligula, aliquam eu ex ac, sollicitudin pretium enim.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PinCodeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                    backgroundColor: Color(0xFF33808C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black.withOpacity(0.2),
                    elevation: 10,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Үргэлжлүүлэх',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
