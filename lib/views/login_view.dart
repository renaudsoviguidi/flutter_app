import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/register_page.dart';
import 'package:flutter_application_1/views/widgets/input_widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                "Page d'authentification"
              ),
              const SizedBox(
                height: 30.0,
              ),
              InputWidget(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(
                height: 20.0
              ),
              InputWidget(
                hintText: "Mot de passe",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20.0
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, 
                    vertical: 15.0
                  )
                ),
                onPressed: () {},
                child: const Text(
                  "Se connecter"
                )
              ),
              const SizedBox(
                height: 20.0
              ),
              TextButton(
                onPressed: (){
                  Get.to(() => const RegisterPage());
                },
                child: const Text("Vous n'avez pas un compte ? Inscrivez-vous")
              )
            ],
          ),
        ),
      ),
    );
  }
}