import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication.dart';
import 'package:flutter_application_1/views/auth/login_view.dart';
import 'package:flutter_application_1/views/widgets/test_input_widget.dart';
import 'package:get/get.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
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
                "Page d'inscription",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TestInputWidget(
                hintText: "Nom",
                obscureText: false,
                controller: _nomController,
              ),
              const SizedBox(height: 20.0),
              TestInputWidget(
                hintText: "Prenoms",
                obscureText: false,
                controller: _prenomsController,
              ),
              const SizedBox(height: 20.0),
              TestInputWidget(
                hintText: "Téléphone",
                obscureText: false,
                controller: _telephoneController,
              ),
              const SizedBox(height: 20.0),
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
              TestInputWidget(
                hintText: "Adresse",
                obscureText: false,
                controller: _adresseController,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15.0)),
                onPressed: () async {
                  await _customAuthController.register(
                      nom: _nomController.text.trim(),
                      prenoms: _prenomsController.text.trim(),
                      email: _emailController.text.trim(),
                      telephone: _telephoneController.text.trim(),
                      adresse: _adresseController.text.trim(),
                      password: _passwordController.text.trim(),
                      confirmpassword: _passwordController.text.trim(),);
                },
                child: Obx(() {
                  return _customAuthController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : const Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                }),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () {
                    Get.to(() => const LoginPage2());
                  },
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                      fontSize: 20.0,
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
