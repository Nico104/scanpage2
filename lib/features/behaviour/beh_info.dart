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
    return ListView(
      shrinkWrap: true,
      children: [
        behaviourInformation.goodWithStrangers != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithStrangers!),
                title: "Friendly to Strangers",
                subtitle: "Honey is nice to new people",
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithCars != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithCars!),
                title: "Good with Cars",
                subtitle: "Honey doesnt get agitaded around cars",
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithDogs != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithDogs!),
                title: "Friendly to dogs",
                subtitle: "Honey is nice with other dogs",
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithCats != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithCats!),
                title: "Friendly to cats",
                subtitle: "Honey is nice with cats",
              )
            : const SizedBox.shrink(),
        behaviourInformation.goodWithKids != null
            ? BehItem(
                answer: getAnswer(behaviourInformation.goodWithKids!),
                title: "Friendly to Kids",
                subtitle: "Honey is nice to children",
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
