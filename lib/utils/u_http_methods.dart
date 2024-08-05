import 'dart:convert';
import 'package:http/http.dart' as http;
import '../general/network_globals.dart';
import 'models/m_pet_profile.dart';

Future<PetProfileDetails> getPetFromScan(String code) async {
  // Uri url = Uri.parse('$baseURL/pet/getPetFromScan/$code');

  // final response = await http.get(url);

  // print(response.body);

  String tmpPet =
      '{"profile_id":1,"profile_creation_DateTime":"2023-05-25T12:07:36.628Z","uid":"kpDO9JHq6vbcnVNYZZ0J9HCq5bG2","pet_name":"Taco","pet_gender":"NONE","pet_chip_id":"fg","pet_is_Lost":true,"pet_is_lost_text":"","hide_contacts":false,"pet_description":[{"petProfile_id":1,"description_text":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.","description_language_key":"de","description_language":{"language_key":"de","language_key_translate":"EN","language_label":"Deutsch","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"}}],"pet_documents":[{"document_id":3,"petProfile_id":1,"document_name":"Lernbericht zur Lehrveranstaltung _Kommunikation und Präsentation_ (1)","document_link":"petdocuments/documents/c412008a7a0dc0affe832feb3053740c","content_type":"pdf"}],"Contact":[{"contact_id":14,"contact_creation_DateTime":"2023-05-27T09:37:27.363Z","contact_name":"Tabo and Pupu","contact_picture_link":null,"contact_description":"","contact_email":"taboanpupu@gmail.com","contact_address":"Wiener Straße 22, Wien","contact_facebook":"@taboandpupu","contact_instagram":"@longusschlongus","uid":"kpDO9JHq6vbcnVNYZZ0J9HCq5bG2","contact_telephone_numbers":[{"phone_number_id":3,"phone_number":"333 333 5678","phone_number_priority":0,"countryLanguage_key":"es","contactContact_id":14,"Country":{"country_key":"es","country_flag_image_path":"/spain","country_phone_prefix":"+34","language_key":"es","country_language":{"language_key":"es","language_key_translate":"EN","language_label":"Espaniol","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"}}},{"phone_number_id":2,"phone_number":"665 524 5433","phone_number_priority":0,"countryLanguage_key":"de","contactContact_id":14,"Country":{"country_key":"de","country_flag_image_path":"/germany","country_phone_prefix":"+49","language_key":"de","country_language":{"language_key":"de","language_key_translate":"EN","language_label":"Deutsch","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"}}}],"languages_spoken":[{"language_key":"de","language_key_translate":"EN","language_label":"Deutsch","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"},{"language_key":"en-GB","language_key_translate":"EN","language_label":"English","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"},{"language_key":"es","language_key_translate":"EN","language_label":"Espaniol","language_isAvailableForAppTranslation":false,"langauge_flag_image_path":"flags/langauge/english_flag.png"}]}],"pet_pictures":[],"Tag":[{"collarTag_id":"pululu","petProfile_id":1,"uid":"akwKWTotCiffXdQL69zUpjuPZEy2","assignedDate":null,"activationCode":"pululu","picturePath":"","createdDate":"2024-02-16T16:38:31.753Z"}],"pet_profile_scans":[],"BehaviourInformation":{"behaviour_information_id":1,"petProfile_id":1,"good_with_kids":null,"good_with_cats":true,"good_with_dogs":null,"good_with_cars":true,"good_with_strangers":null},"MedicalInformation":{"medical_information_id":1,"petProfile_id":1,"sterilized":false,"health_issues":[{"health_issue_id":1,"health_issue_name":"Allergic to Gluten","health_issue_type":"Allergies","documentDocument_id":null,"medicalInformationMedical_information_id":1},{"health_issue_id":2,"health_issue_name":"Weak left Behindleg","health_issue_type":"misc","documentDocument_id":3,"medicalInformationMedical_information_id":1},{"health_issue_id":5,"health_issue_name":"Vacined for cancer","health_issue_type":"misc","documentDocument_id":3,"medicalInformationMedical_information_id":1}]}}';

  // if (response.statusCode == 200) {
  if (true) {
    PetProfileDetails pet = PetProfileDetails.fromJson(jsonDecode(tmpPet));
    print(pet.petName);
    return pet;
  } else {
    throw Exception('Failed to load Pet');
  }
}
