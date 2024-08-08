import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scanpage/utils/models/m_behaviour_information.dart';
import '../general/network_globals.dart';
import 'models/m_pet_profile.dart';

Future<PetProfileDetails> getPetFromScan(String code,
    {bool scanned = false}) async {
  Uri url = Uri.parse('$baseURL/pet/getPetFromScan/$code');

  final response = await http.get(url);

  print(response.statusCode);
  if (response.statusCode == 200) {
    PetProfileDetails pet =
        PetProfileDetails.fromJson(jsonDecode(response.body));
    if (scanned) {
      createNewScan(pet.profileId);
    }
    return pet;
  } else {
    throw Exception('Failed to load PetProfileDetails');
  }
}

Future<PetProfileDetails> getPetFromId(
  String id,
) async {
  Uri url = Uri.parse('$baseURL/pet/getPet/$id');

  final response = await http.get(url);

  print(response.statusCode);
  if (response.statusCode == 200) {
    PetProfileDetails pet =
        PetProfileDetails.fromJson(jsonDecode(response.body));
    return pet;
  } else {
    throw Exception('Failed to load PetProfileDetails');
  }
}

Future<void> createNewScan(int petProfileId) async {
  Uri url = Uri.parse('$baseURL/scan/createScan');

  print("yo");

  final response = http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      // 'Authorization': '$token',
    },
    body: jsonEncode(
      {
        'petProfileId': petProfileId,
      },
    ),
  );
}

Future<void> sendLocation(int petProfileId, String lat, String lon) async {
  Uri url = Uri.parse('$baseURL/scan/sendLocation');

  final response = http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      // 'Authorization': '$token',
    },
    body: jsonEncode(
      {
        'petProfileId': petProfileId,
        'lat': lat,
        'lon': lon,
      },
    ),
  );
}

Future<void> sendContactInformation(
    int petProfileId, String contactInformation) async {
  Uri url = Uri.parse('$baseURL/scan/sendContactInformation');

  final response = http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      // 'Authorization': '$token',
    },
    body: jsonEncode(
      {
        'petProfileId': petProfileId,
        'contactInformation': contactInformation,
      },
    ),
  );
}
