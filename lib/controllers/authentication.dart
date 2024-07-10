import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/views/auth/login_page.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class CustomAuthController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String nom,
    required String prenoms,
    required String email,
    required String telephone,
    required String adresse,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'nom': nom,
        'prenoms': prenoms,
        'email': email,
        'telephone': telephone,
        'adresse': adresse,
        'password': password,
        'confirmpassword': confirmpassword
      };

      //Lier l'api à flutter
      var response = await http.post(
        Uri.parse('${url}register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      //Vérifier la response envoyée
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;        
        token.value = responseData['token'];
        box.write('token', token.value);

        Get.snackbar('Succès', responseData['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        //Renvoyer vers le loginpage
        Get.offAll(() => const LoginPage());
      } else {
        isLoading.value = false;
        Get.snackbar('Erreur', responseData['error'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        //print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      //print(e.toString());
    }
  }

  //Fonction pour l'authentification
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };

      //Lier l'api à flutter
      var response = await http.post(
        Uri.parse('${url}login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      //Vérifier la response envoyée
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = responseData['token'];
        box.write('token', token.value);
        //Renvoyer vers la homepage
        Get.offAll(() => const HomePage());
      } else {
        isLoading.value = false;
        Get.snackbar('Erreur', responseData['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }      
    } catch (e) {
      isLoading.value = false;
      //print(e.toString());
    }
  }
}
