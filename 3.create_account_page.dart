import 'package:andating/2.welcome_page.dart';
import 'package:flutter/material.dart';
import '1.loading_page.dart';

// Enum strength mật khẩu
enum PasswordStrength { weak, medium, strong, veryStrong, empty }

PasswordStrength checkPasswordStrength(String password) {
  if (password.isEmpty) return PasswordStrength.empty;
  bool hasNumber = password.contains(RegExp(r'[0-9]'));
  bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  if (password.length < 6) return PasswordStrength.weak;
  if (password.length < 10) return PasswordStrength.medium;
  if (password.length >= 10 && (!hasNumber || !hasSpecial)) return PasswordStrength.strong;
  if (password.length >= 10 && hasNumber && hasSpecial) return PasswordStrength.veryStrong;
  return PasswordStrength.weak;
}

// Widget PasswordField
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  String password = '';

  bool get isLengthValid => password.length >= 8;
  bool get hasNumber => password.contains(RegExp(r'[0-9]'));
  bool get hasSpecial => password.contains(RegExp(r'[!@#$%^&*]'));
  bool get allValid => isLengthValid && hasNumber && hasSpecial;

  @override
  Widget build(BuildContext context) {
    Color textColor(bool condition) =>
        condition ? Colors.white : Colors.white70;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: obscureText,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password, color: Colors.pinkAccent),
            suffixIcon: IconButton(
              icon:
                  Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: allValid ? Colors.white : Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white10, // nền đen mờ
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 12),

        // Checklist
        Row(
          children: [
            Icon(
              isLengthValid ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isLengthValid ? Colors.pinkAccent : Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "Must be at least 8 characters long",
              style: TextStyle(color: textColor(isLengthValid)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(
              hasNumber ? Icons.check_circle : Icons.radio_button_unchecked,
              color: hasNumber ? Colors.pinkAccent : Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "Include at least 1 number",
              style: TextStyle(color: textColor(hasNumber)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(
              hasSpecial ? Icons.check_circle : Icons.radio_button_unchecked,
              color: hasSpecial ? Colors.pinkAccent : Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "Include at least 1 special character (!@#\$%^&*)",
              style: TextStyle(color: textColor(hasSpecial)),
            ),
          ],
        ),
      ],
    );
  }
}

// ----------------------------
// CREATE ACCOUNT PAGE
// ----------------------------
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool agreeTerms = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      "Create account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Find your perfect match today",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 30),

                    // Full Name
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person, color: Colors.pinkAccent),
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white24, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.pinkAccent, width: 2)),
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email, color: Colors.pinkAccent),
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white24, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.pinkAccent, width: 2)),
                        fillColor: Colors.white10,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    const PasswordField(),
                    const SizedBox(height: 16),

                    // Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: agreeTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeTerms = value ?? false;
                            });
                          },
                          activeColor: Colors.pinkAccent,
                          checkColor: Colors.white,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: const TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                    text: 'Terms of Service',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent)),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: agreeTerms
                            ? () {
                                // TODO: Xử lý create account
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text("Create Account"),
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
