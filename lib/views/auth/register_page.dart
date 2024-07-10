import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication.dart';
import 'package:flutter_application_1/views/auth/login_page.dart';
import 'package:flutter_application_1/views/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final CustomAuthController _customAuthController = Get.put(CustomAuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nouveau-logo.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                // Text de bienvenue
                Text('Bienvenue!', style: GoogleFonts.bebasNeue(fontSize: 40)),
                const SizedBox(height: 10),
                const Text(
                  'Inscrivez-vous sur EventChills!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),

                // nom field
                InputWidget(
                    hintText: 'Nom',
                    controller: _nomController,
                    obscureText: false),
                const SizedBox(height: 10),

                // prenoms field
                InputWidget(
                    hintText: 'Prénom(s)',
                    controller: _prenomsController,
                    obscureText: false),
                const SizedBox(height: 10),

                // email field
                InputWidget(
                    hintText: 'Email',
                    controller: _emailController,
                    obscureText: false),
                const SizedBox(height: 10),

                // telephone field
                InputWidget(
                    hintText: 'N° WhatsApp',
                    controller: _telephoneController,
                    obscureText: false),
                const SizedBox(height: 10),

                // password field
                InputWidget(
                  hintText: 'Mot de passe',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // confirm_password field
                InputWidget(
                    hintText: 'Confirmer mot de passe',
                    controller: _confirmpasswordController,
                    obscureText: true),
                const SizedBox(height: 10),

                // se connecter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      await _customAuthController.register(
                          nom: _nomController.text.trim(),
                          prenoms: _prenomsController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          confirmpassword: _confirmpasswordController.text.trim(),
                          telephone: _telephoneController.text.trim(),
                          adresse: _adresseController.text.trim(),
                        );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xFFc71f5d),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Obx(() {
                          return _customAuthController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'S\'inscrire',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                );
                        }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // s'inscrire
                GestureDetector(
                  onTap: (){
                    Get.to(() => const LoginPage());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vous avez un compte ?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Se connecter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFc71f5d)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}