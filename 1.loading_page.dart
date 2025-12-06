import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '2.welcome_page.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    // Loading bar chạy 4s
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        progress += 0.025;
      });

      if (progress >= 1.0) {
  timer.cancel();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const WelcomePage()),
  );
}

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // -----------------------
          //  GALAXY BACKGROUND
          // -----------------------
          const Positioned.fill(
            child: CustomPaint(
              painter: GalaxyPainter(),
            ),
          ),

          // Tên app + loading bar
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TWINKE",
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 252, 182, 205),
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(height: 50),

              // Loading bar 4s
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              )
            ],
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
          )
        ],
      ),
    );
  }
}

// ----- GALAXY BACKGROUND PAINTER -----
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
        Color(0xFF0A003A), // xanh đậm
        Color(0xFF24004A), // tím
        Color(0xFF6A0A6F), // hồng tím
        Color(0xFFB8008A), // hồng neon
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
