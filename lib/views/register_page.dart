import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/login_view.dart';
import 'package:flutter_application_1/views/widgets/input_widget.dart';
import 'package:get/get.dart';

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
                ),
              const SizedBox(
                height: 30.0,
              ),
              InputWidget(
                hintText: "Nom",
                obscureText: false,
                controller: _nomController,
              ),
              const SizedBox(
                height: 20.0
              ),
              InputWidget(
                hintText: "Prenoms",
                obscureText: false,
                controller: _prenomsController,
              ),
              const SizedBox(
                height: 20.0
              ),
              InputWidget(
                hintText: "Téléphone",
                obscureText: false,
                controller: _telephoneController,
              ),
              const SizedBox(
                height: 20.0
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
              InputWidget(
                hintText: "Confirmer mot de passe",
                obscureText: true,
                controller: _confirmpasswordController,
              ),
              const SizedBox(
                height: 20.0
              ),
              InputWidget(
                hintText: "Adresse",
                obscureText: false,
                controller: _adresseController,
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
                  "S'inscrire",
                  
                ),
              ),
              const SizedBox(
                height: 20.0
              ),
              TextButton(
                onPressed: (){
                  Get.to(() => const LoginPage  ());
                },
                child: const Text("Se connecter")
              )
            ],
          ),
        ),
      ),
    );
  }
}