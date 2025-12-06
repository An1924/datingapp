import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '2.welcome_page.dart';
import '3.create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // -----------------------
            // HEADER iPhone
            // -----------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "9:41",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Icon(Icons.wifi, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Icon(Icons.battery_full, color: Colors.white, size: 16),
                    ],
                  ),
                ],
              ),
            ),

            // -----------------------
            // Scrollable Content
            // -----------------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // quay về WelcomePage
                      },
                    ),
                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Welcome back! Please login to your account",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 30),

                    // Username
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person, color: Colors.pinkAccent),
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
                        ),
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password, color: Colors.pinkAccent),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white70),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
                        ),
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    // Remember me checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                          activeColor: Colors.pinkAccent,
                          checkColor: Colors.white,
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // LOGIN button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Xử lý login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("LOGIN"),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Not a member? Sign up now
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Not a member? ",
                          style: const TextStyle(color: Colors.white70),
                          children: [
                            TextSpan(
                              text: "Sign up now",
                              style: const TextStyle(
                                color: Colors.pinkAccent,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const CreateAccountPage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // -----------------------
            // FOOTER (home bar)
            // -----------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
      ),
    );
  }
}
