import 'package:flutter/material.dart';
import '3.create_account_page.dart';
import '1.loading_page.dart';
import '4.login_page.dart';
import 'dart:math';
import 'dart:ui' as ui;

// -----------------------
// WELCOME / CHOICE PAGE
// -----------------------
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // -----------------------
          // BACKGROUND GALAXY
          // -----------------------
          const Positioned.fill(
            child: CustomPaint(
              painter: GalaxyPainter(),
            ),
          ),

          // -----------------------
          // HEADER iPhone
          // -----------------------
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "9:41",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),

                // Icons
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: const [
                      Icon(Icons.signal_cellular_alt, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Icon(Icons.wifi, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Icon(Icons.battery_full, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // -----------------------
          // BUTTONS (Login / Sign Up)
          // -----------------------
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // SIGN UP BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CreateAccountPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.7),
                      foregroundColor: Colors.pinkAccent,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.pinkAccent, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // -----------------------
          // FOOTER (home bar)
          // -----------------------
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 140,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// -----------------------
// GALAXY PAINTER (như Loading Page)
// -----------------------
class GalaxyPainter extends CustomPainter {
  const GalaxyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Layer 1: Gradient tím – xanh – hồng
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF0A003A),
        Color(0xFF24004A),
        Color(0xFF6A0A6F),
        Color(0xFFB8008A),
      ],
    ).createShader(rect);
    canvas.drawRect(rect, paint);

    // Layer 2: Vệt sáng Galaxy
    final glowPaint = Paint()
      ..shader = RadialGradient(
        radius: 0.8,
        colors: [
          Colors.pinkAccent.withOpacity(0.35),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.6, size.height * 0.3),
        radius: size.width * 0.7,
      ));
    canvas.drawRect(rect, glowPaint);

    // Layer 3: Sao (stars)
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 1.2;

    final random = Random();
    for (int i = 0; i < 120; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      canvas.drawPoints(ui.PointMode.points, [Offset(dx, dy)], starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
