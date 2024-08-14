import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/init_page.dart';
import 'package:scanpage/utils/utils_general.dart';
import 'package:scanpage/utils/utils_theme/custom_colors.dart';
import 'package:scanpage/utils/widgets/custom_textformfield.dart';
import 'package:sizer/sizer.dart';

class LookForTag extends StatefulWidget {
  const LookForTag({Key? key}) : super(key: key);

  @override
  State<LookForTag> createState() => _LookForTagState();
}

class _LookForTagState extends State<LookForTag> {
  // final TextEditingController _controller = TextEditingController();

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                "sp_LookForTag_Title".tr(),
                style: GoogleFonts.prompt(
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                width: 35.w,
                child: Material(
                  borderRadius: BorderRadius.circular(2),
                  elevation: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset("assets/code_illustration.png")),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Text(
                "sp_LookForTag_Instructions".tr(),
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                "sp_LookForTag_EnterCode".tr(),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              CustomTextFormField(
                maxLines: 1,
                // controller: _controller,
                // decoration: InputDecoration(
                //   hintText: 'Enter Code',
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(12),
                //     borderSide: BorderSide.none,
                //   ),
                //   filled: true,
                //   fillColor: Colors.grey[200],
                //   contentPadding:
                //       EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                // ),
                // textAlign: TextAlign.center,
                onChanged: (p0) {
                  text = p0;
                },
                hintText: "*** *** ***",
                textAlign: TextAlign.center,
                showSuffix: false,
                // labelText: "Enter Code",
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  // Add your search logic here
                  // print('Code entered: ${_controller.text}');

                  // String code = _controller.text;
                  String code = text;
                  bool scanned = code.endsWith('1');

                  // code = code.substring(0, code.length - 1);
                  print("codE" + code);

                  navigatePerSlide(
                    context,
                    InitPage(
                      code: code,
                      scanned: true,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // color: Colors.blueAccent,
                  backgroundColor: getCustomColors(context).accent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Text(
                "sp_LookForTag_ContactIfFailure".tr() + 'email@email.com',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
