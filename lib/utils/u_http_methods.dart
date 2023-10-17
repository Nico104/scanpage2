import 'dart:convert';
import 'package:http/http.dart' as http;
import '../general/network_globals.dart';
import 'models/m_pet_profile.dart';

Future<PetProfileDetails> getPetFromScan(String code) async {
  Uri url = Uri.parse('$baseURL/pet/getPetFromScan/$code');
  // String? token = await getIdToken();

  final response = await http.get(
    url,
    headers: {
      // "Access-Control-Allow-Origin": "*",
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      // // 'Authorization': '$token',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    return PetProfileDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pet');
  }
}
