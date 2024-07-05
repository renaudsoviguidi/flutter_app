import 'package:get/get.dart';

class CustomAuthController extends GetxController {
  final isLoading = false.obs;

  Future register(
    {
      required String nom,
      required String prenoms,
      required String email,
      required String telephone,
      required String adresse,
      required String password,
      required String confirmpassword,
    }
  ) async {
    var data = {
      'nom': nom,
      'prenoms': prenoms,
      'email': email,
      'telephone': telephone,
      'adresse': adresse,
      'password': password,
      'confirmpassword': confirmpassword,
    };
  }
}