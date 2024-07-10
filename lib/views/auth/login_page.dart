import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication.dart';
import 'package:flutter_application_1/views/auth/register_page.dart';
import 'package:flutter_application_1/views/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CustomAuthController _customAuthController =
      Get.put(CustomAuthController());

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
                const SizedBox(height: 50),
                // Text de bienvenue
                Text('Bonjour!', style: GoogleFonts.bebasNeue(fontSize: 52)),
                const SizedBox(height: 10),
                const Text(
                  'Bon retour, tu nous as manqué!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),

                // email field
                InputWidget(
                    hintText: 'Email',
                    controller: _emailController,
                    obscureText: false),
                const SizedBox(height: 10),

                // password field
                InputWidget(
                  hintText: 'Mot de passe',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Mot de passe oublié ?'),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // se connecter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      await _customAuthController.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
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
                                  'Se connecter',
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
                  onTap: () {
                    Get.to(() => const RegisterPage());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vous n\'avez pas un compte ?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Inscrivez-vous',
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
