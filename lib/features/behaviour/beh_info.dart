import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/models/m_behaviour_information.dart';
import '../../utils/models/m_contact.dart';
import 'beh_item.dart';

class BehInformation extends StatelessWidget {
  const BehInformation({Key? key, required this.behaviourInformation})
      : super(key: key);

  final BehaviourInformation behaviourInformation;

  @override
  Widget build(BuildContext context) {
    print(behaviourInformation.goodWithCars);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        behaviourInformation.goodWithStrangers != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithStrangers!),
                title: "sp_BehInfo_StrangersLabel".tr(),
                subtitle: "sp_BehInfo_StarngersDescription".tr(),
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithCars != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithCars!),
                title: "sp_BehInfo_CarsLabel".tr(),
                subtitle: "sp_BehInfo_CarsDescription",
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithDogs != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithDogs!),
                title: "sp_BehInfo_DogsLabel".tr(),
                subtitle: "sp_BehInfo_DogsDescription".tr(),
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithCats != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithCats!),
                title: "sp_BehInfo_CatsLabel".tr(),
                subtitle: "sp_BehInfo_CatsDescription".tr(),
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithKids != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithKids!),
                title: "sp_BehInfo_KidsLabel".tr(),
                subtitle: "Honey is nice to children".tr(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

String getAnswer(bool answer) {
  if (answer) {
    return "Yes";
  } else {
    return "No";
  }
}
