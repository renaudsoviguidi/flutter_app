import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication.dart';
import 'package:flutter_application_1/views/auth/login_page.dart';
import 'package:flutter_application_1/views/auth/register_view.dart';
import 'package:flutter_application_1/views/widgets/test_input_widget.dart';
import 'package:get/get.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CustomAuthController _customAuthController =
      Get.put(CustomAuthController());

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Page d'authentification",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TestInputWidget(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 20.0),
              TestInputWidget(
                hintText: "Mot de passe",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 15.0)),
                  onPressed: () async {
                    await _customAuthController.login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());
                  },
                  child: Obx(() {
                    return _customAuthController.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Se connecter",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  })),
              const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () {
                    Get.to(() => const RegisterPage2());
                  },
                  child: const Text(
                    "Vous n'avez pas un compte ? Inscrivez-vous",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () {
                    Get.to(() => const LoginPage());
                  },
                  child: const Text(
                    "Login page 2",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
