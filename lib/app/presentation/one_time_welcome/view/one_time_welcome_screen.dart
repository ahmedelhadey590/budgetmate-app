import 'package:budgetmate/app/presentation/login/view/login.dart';
import 'package:budgetmate/app/presentation/register/view/register.dart';
import 'package:budgetmate/app/presentation/one_time_welcome/controller/oneTimeWelcomeController.dart';
import 'package:budgetmate/app/shared/class/BackgroundCirclePainter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneTimeWelcomeScreen extends StatelessWidget {
  OneTimeWelcomeScreen({super.key});

  final oneTimeWelcomeController controller = Get.put(oneTimeWelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //backgroundColor: Color(0xFFF3F8FA),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundCirclesPainter(),
              ),
            ),
            // Top Right Icon
            Positioned(
              top: 100,
              right: 30,
              child: Image.asset(
                'assets/pie_chart_icon.png',
                width: 60,
                height: 60,
              ),
            ),
            Positioned(
              top: 450,
              left: 40,
              child: Image.asset(
                'assets/dollar_icon.png',
                width: 60,
                height: 60,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Center(
                  child: Text(
                    "Spend Smarter\nSave More",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E9A7D),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 350),
                // Get Started Button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF42BBA4), Color(0xFF209D86)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF209D86),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Log In Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account? ",
                      style: TextStyle(
                        color: Color(0xFF4C6F6A),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xFF209D86),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
