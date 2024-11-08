// screens/splash_screen.dart
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
                SizedBox(height: 150),
                Image.asset(
                  'assets/intro_screen_illustration.png',
                  height: 400,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome NoteVault',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed risus ligula, aliquam eu ex ac, sollicitudin pretium enim.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    backgroundColor: Color(0xFF33808C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black.withOpacity(0.2),
                    elevation: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Үргэлжлүүлэх',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
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
