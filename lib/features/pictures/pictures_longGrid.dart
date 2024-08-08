import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/features/pictures/pictures_widget.dart';
import 'package:scanpage/utils/models/m_pet_picture.dart';
import 'package:scanpage/utils/widgets/custom_scroll_view.dart';
import 'package:sizer/sizer.dart';

class PicturesPage extends StatefulWidget {
  const PicturesPage({
    super.key,
    required this.initialPetPictures,
    // required this.petProfileId
  });

  final List<PetPicture> initialPetPictures;
  // final int petProfileId;

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  late List<PetPicture> pictures;
  bool _showShyButton = true;

  @override
  void initState() {
    super.initState();
    pictures = widget.initialPetPictures;
  }

  // Future<void> reloadPetPictures() async {
  //   pictures = await getPetPictures(widget.petProfileId);
  //   setState(() {});
  // }

  @override
  void didUpdateWidget(covariant PicturesPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    //Needed since docuemnts dont get accessed directly so updating it has effect
    pictures = widget.initialPetPictures;
  }

  Widget getNoPicturesWidget() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pictures"),
      ),
      body: Column(
        children: [
          const Spacer(),
          Image.asset("assets/tmp/dog_bowl.png"),
          const SizedBox(height: 8),
          Text(
            "It looks quite empty in here",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "picturesPage_noPictures".tr(),
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // ShyButton(
          //   showUploadButton: true,
          //   onTap: () {
          //     _uploadPicture();
          //   },
          //   label: "picturesPage_uploadPictureLabel".tr(),
          // ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pictures.isNotEmpty) {
      return Scaffold(
        body: Stack(
          children: [
            CustomNicoScrollView(
              // onScroll: _handleNavBarShown,
              // onScroll: () => handleShyButtonShown(
              //   setShowShyButton: (p0) {
              //     setState(() {
              //       _showShyButton = p0;
              //     });
              //   },
              // ),
              title: Text("picturesPage_Title".tr()),
              // actions: [
              //   Icon(Icons.close_rounded),
              // ],
              body: Column(
                children: [
                  GridView.builder(
                    itemCount: pictures.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisCount: 1,
                      childAspectRatio: 1,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PictureItem(
                          picture: pictures.elementAt(index),
                          expandable: true,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 90.h),
                ],
              ),
              onScroll: () {},
            ),
            // ShyButton(
            //   label: "picturesPage_uploadPictureLabel".tr(),
            //   showUploadButton: _showShyButton,
            //   onTap: () => _uploadPicture(),
            //   icon: const Icon(
            //     Icons.file_upload_rounded,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      );
    } else {
      return getNoPicturesWidget();
    }
  }
}
