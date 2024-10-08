// import 'package:userapp/feature/pets/profile_details/models/m_contact.dart';

import 'package:scanpage/features/behaviour/beh_info.dart';
import 'package:scanpage/utils/models/m_behaviour_information.dart';
import 'package:scanpage/utils/models/m_contact.dart';
import 'package:scanpage/utils/models/medical/m_medical_information.dart';

import 'm_description.dart';
import 'm_document.dart';
import 'm_pet_picture.dart';
// import 'm_scan.dart';
// import 'm_tag.dart';

enum Gender { male, female, none }

class PetProfileDetails {
  final int profileId;
  final DateTime? profileCreationDateTime;
  String petName;
  Gender petGender;
  String? petChipId;
  // List<Description> petDescription;
  String petIsLostText;
  // ImportantInformation petImportantInformation;
  // String? petOwnerName;
  // List<PhoneNumber> petOwnerTelephoneNumbers;
  // String? petOwnerEmail;
  // String? petOwnerLivingPlace;
  // String? petOwnerFacebook;
  // String? petOwnerInstagram;
  List<Contact> petContacts;
  List<Document> petDocuments;
  List<PetPicture> petPictures;
  bool petIsLost;
  // List<Tag> tag;
  // final List<Scan> petProfileScans;
  String? pet_tattooID;
  String? pet_licenceID;
  String? pet_favorite_toys;
  String? pet_favorite_activities;
  String? pet_behavioral_notes;
  String? pet_special_needs;
  String? pet_diet_preferences;
  bool scan_hide_contacts;
  bool scan_hide_information;
  bool scan_hide_medical;
  bool scan_hide_pictures;
  bool scan_hide_documents;
  bool scan_hide_description;
  bool hide_contacts;
  bool hide_information;
  bool hide_medical;
  bool hide_pictures;
  bool hide_documents;
  bool hide_description;
  String description;
  MedicalInformation medicalInformation;
  BehaviourInformation behaviourInformation;

  // PetProfileDetails clone() => PetProfileDetails(
  //       profileId,
  //       profileCreationDateTime,
  //       petName,
  //       petGender,
  //       petChipId,
  //       // petOwnerName,
  //       // petOwnerEmail,
  //       // petOwnerLivingPlace,
  //       // petOwnerFacebook,
  //       // petOwnerInstagram,
  //       petContacts,
  //       petIsLost,
  //       petDescription.map((element) => element.clone()).toList(),
  //       List.from(petImportantInformation),
  //       // List.from(petOwnerTelephoneNumbers),
  //       List.from(petDocuments),
  //       List.from(petPictures),
  //       List.from(petProfileScans),
  //       List.from(tag),
  //     );

  PetProfileDetails(
    this.profileId,
    this.profileCreationDateTime,
    this.petName,
    this.petGender,
    this.petChipId,
    // this.petOwnerName,
    // this.petOwnerEmail,
    // this.petOwnerLivingPlace,
    // this.petOwnerFacebook,
    // this.petOwnerInstagram,
    this.petContacts,
    this.petIsLost,
    // this.petDescription,
    this.petIsLostText,
    // this.petOwnerTelephoneNumbers,
    this.petDocuments,
    this.petPictures,
    // this.petProfileScans,
    // this.tag,
    this.hide_contacts,
    this.pet_behavioral_notes,
    this.pet_diet_preferences,
    this.pet_favorite_activities,
    this.pet_favorite_toys,
    this.pet_licenceID,
    this.pet_special_needs,
    this.pet_tattooID,
    this.scan_hide_contacts,
    this.scan_hide_description,
    this.scan_hide_documents,
    this.scan_hide_information,
    this.scan_hide_medical,
    this.scan_hide_pictures,
    this.hide_description,
    this.hide_documents,
    this.hide_information,
    this.hide_medical,
    this.hide_pictures,
    this.description,
    this.medicalInformation,
    this.behaviourInformation,
  );

  PetProfileDetails.fromJson(Map<String, dynamic> json)
      : profileId = json['profile_id'],
        description = json['description'],
        profileCreationDateTime =
            DateTime.parse(json['profile_creation_DateTime']),
        petName = json['pet_name'],
        petGender = parseGenderFromString(json['pet_gender']),
        petChipId = json['pet_chip_id'],
        // petOwnerName = json['pet_owner_name'],
        // petOwnerEmail = json['pet_owner_email'],
        // petOwnerLivingPlace = json['pet_owner_living_place'],
        // petOwnerFacebook = json['pet_owner_facebook'],
        // petOwnerInstagram = json['pet_owner_instagram'],
        petIsLost = json['pet_is_Lost'],
        // petDescription = json['pet_description'] != null
        //     ? (json['pet_description'] as List)
        //         .map((t) => Description.fromJson(t))
        //         .toList()
        //     : [],
        // petImportantInformation = json['pet_important_information'] != null
        //     ? (json['pet_important_information'] as List)
        //         .map((t) => ImportantInformation.fromJson(t))
        //         .toList()
        //     : [],
        medicalInformation =
            MedicalInformation.fromJson(json['MedicalInformation']),
        behaviourInformation =
            BehaviourInformation.fromJson(json['BehaviourInformation']),
        petIsLostText = json['pet_is_lost_text'],
        scan_hide_contacts = json['scan_hide_contacts'],
        scan_hide_information = json['scan_hide_information'],
        scan_hide_medical = json['scan_hide_medical'],
        scan_hide_pictures = json['scan_hide_pictures'],
        scan_hide_documents = json['scan_hide_documents'],
        scan_hide_description = json['scan_hide_description'],
        hide_contacts = json['hide_contacts'],
        hide_information = json['hide_information'],
        hide_medical = json['hide_medical'],
        hide_pictures = json['hide_pictures'],
        hide_documents = json['hide_documents'],
        hide_description = json['hide_description'],
        petContacts = json['Contact'] != null
            ? (json['Contact'] as List).map((t) => Contact.fromJson(t)).toList()
            : [],
        petDocuments = json['pet_documents'] != null
            ? (json['pet_documents'] as List)
                .map((t) => Document.fromJson(t))
                .toList()
            : [],
        petPictures = json['pet_pictures'] != null
            ? (json['pet_pictures'] as List)
                .map((t) => PetPicture.fromJson(t))
                .toList()
            : [],
        // petProfileScans = json['pet_profile_scans'] != null
        //     ? (json['pet_profile_scans'] as List)
        //         .map((t) => Scan.fromJson(t))
        //         .toList()
        //     : [],
        // tag = json['Tag'] != null
        //     ? (json['Tag'] as List).map((t) => Tag.fromJson(t)).toList()
        //     : [],
        pet_tattooID = json['pet_tattooID'],
        pet_licenceID = json['pet_licenceID'],
        pet_favorite_toys = json['pet_favorite_toys'],
        pet_favorite_activities = json['pet_favorite_activities'],
        pet_behavioral_notes = json['pet_behavioral_notes'],
        pet_special_needs = json['pet_special_needs'],
        pet_diet_preferences = json['pet_diet_preferences'];

  //New PetProfileDetails Object for creatring new Profile
  // PetProfileDetails.createNewEmptyProfile(this.tag)
  //     : profileId = null,
  //       profileCreationDateTime = null,
  //       petName = null,
  //       petGender = Gender.none,
  //       petChipId = null,
  //       petOwnerName = null,
  //       petOwnerEmail = null,
  //       petOwnerLivingPlace = null,
  //       petOwnerFacebook = null,
  //       petOwnerInstagram = null,
  //       petIsLost = false,
  //       petDescription = List<Description>.empty(growable: true),
  //       petImportantInformation =
  //           List<ImportantInformation>.empty(growable: true),
  //       petOwnerTelephoneNumbers = List<PhoneNumber>.empty(growable: true),
  //       petDocuments = List<Document>.empty(growable: true),
  //       petPictures = List<PetPicture>.empty(growable: true),
  //       petProfileScans = List<Scan>.empty(growable: false);

  Map<String, dynamic> toJson() => {
        'profile_id': profileId,
        'pet_name': petName,
        'description': description,
        'pet_gender': parseStringFromGender(petGender),
        'pet_chip_id': petChipId,
        // 'pet_owner_name': petOwnerName,
        // 'pet_owner_email': petOwnerEmail,
        // 'pet_owner_living_place': petOwnerLivingPlace,
        // 'pet_owner_facebook': petOwnerFacebook,
        // 'pet_owner_instagram': petOwnerInstagram,
        'pet_is_Lost': petIsLost,
        'pet_is_lost_text': petIsLostText,
        'pet_tattooID': pet_tattooID,
        'pet_licenceID': pet_licenceID,
        'pet_favorite_toys': pet_favorite_toys,
        'pet_favorite_activities': pet_favorite_activities,
        'pet_behavioral_notes': pet_behavioral_notes,
        'pet_special_needs': pet_special_needs,
        'pet_diet_preferences': pet_diet_preferences,

        'hide_contacts': hide_contacts,
        'hide_information': hide_information,
        'hide_medical': hide_medical,
        'hide_pictures': hide_pictures,
        'hide_documents': hide_documents,
        'hide_description': hide_description,

        'scan_hide_contacts': scan_hide_contacts,
        'scan_hide_information': scan_hide_information,
        'scan_hide_medical': scan_hide_medical,
        'scan_hide_pictures': scan_hide_pictures,
        'scan_hide_documents': scan_hide_documents,
        'scan_hide_description': scan_hide_description,
      };
}

Gender parseGenderFromString(String? value) {
  if (value == null) {
    return Gender.none;
  } else {
    if (value.toUpperCase() == "MALE") {
      return Gender.male;
    } else if (value.toUpperCase() == "FEMALE") {
      return Gender.female;
    } else {
      return Gender.none;
    }
  }
}

String parseStringFromGender(Gender value) {
  switch (value) {
    case Gender.male:
      return "MALE";
    case Gender.female:
      return "FEMALE";
    case Gender.none:
      return "NONE";
  }
}
