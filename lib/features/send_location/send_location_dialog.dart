import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanpage/utils/u_http_methods.dart';
import 'package:scanpage/utils/utils_theme/custom_colors.dart';
import 'package:scanpage/utils/utils_theme/custom_text_styles.dart';
import 'package:scanpage/utils/widgets/custom_textformfield.dart';
import 'package:scanpage/utils/widgets/loading_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../general/hex_color.dart';
import '../../utils/widgets/custom_scroll_view.dart';

class SendLocationDialog extends StatefulWidget {
  const SendLocationDialog({
    super.key,
    required this.contactCallback,
    required this.petProfileId,
    required this.resendLocationCallBack,
  });

  final VoidCallback contactCallback;
  final VoidCallback resendLocationCallBack;
  final int petProfileId;

  @override
  State<SendLocationDialog> createState() => _SendLocationDialogState();
}

class _SendLocationDialogState extends State<SendLocationDialog> {
  // void setButtonLoading

  bool _locationSendButtonLoading = false;

  void toggleLoading(Duration duration) async {
    setState(() {
      _locationSendButtonLoading = true;
    });
    await Future.delayed(duration);
    setState(() {
      _locationSendButtonLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "sp_sendLocationDialog_Title".tr(),
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "sp_sendLocationDialog_Description".tr(),
              style: GoogleFonts.prompt(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 30),
            // Text(
            //   "Phone number",
            //   style: GoogleFonts.prompt(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 18,
            //     color: Colors.black.withOpacity(1),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resend Location".tr(),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "Send my GPS Location".tr(),
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // Navigator.pop(context);

                    widget.resendLocationCallBack();
                    toggleLoading(const Duration(seconds: 2));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor("#8A7861"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 80),
                        child: _locationSendButtonLoading
                            ? const CustomLoadingIndicatior()
                            : Text(
                                "sp_sendLocationDialog_Option_Phone_Button"
                                    .tr(),
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: HexColor("#8A7861"),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sp_sendLocationDialog_Option_Phone_Title".tr(),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "sp_sendLocationDialog_Option_Phone_Desc".tr(),
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (_) => SendContactDialog(
                        title: "Enter your Phone Number",
                        hint: "+39 111 111 1111".tr(),
                        confirmLabel: "Send".tr(),
                        textInputType: TextInputType.phone,
                      ),
                    ).then((value) async {
                      if (value != null) {
                        sendContactInformation(widget.petProfileId, value);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor("#8A7861"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Text(
                        "sp_sendLocationDialog_Option_Phone_Button".tr(),
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: HexColor("#8A7861"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sp_sendLocationDialog_Option_Email_Title".tr(),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "sp_sendLocationDialog_Option_Email_Desc".tr(),
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (_) => SendContactDialog(
                        title: "Enter your Email",
                        hint: "myemail@email.mail".tr(),
                        confirmLabel: "Send".tr(),
                        textInputType: TextInputType.emailAddress,
                      ),
                    ).then((value) async {
                      if (value != null) {
                        sendContactInformation(widget.petProfileId, value);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor("#8A7861"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Text(
                        "sp_sendLocationDialog_Option_Email_Button".tr(),
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: HexColor("#8A7861"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sp_sendLocationDialog_Option_Contact_Title".tr(),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "sp_sendLocationDialog_Option_Contact_Desc".tr(),
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: HexColor("#8A7861"),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    widget.contactCallback();
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor("#8A7861"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Text(
                        "sp_sendLocationDialog_Option_Contact_Button".tr(),
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: HexColor("#8A7861"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SendContactDialog extends StatefulWidget {
  const SendContactDialog({
    super.key,
    this.initialValue,
    // required this.label,
    required this.confirmLabel,
    required this.title,
    required this.hint,
    this.textInputType,
  });

  final String? initialValue;
  final String title;
  final String hint;
  final String confirmLabel;

  final TextInputType? textInputType;

  @override
  State<SendContactDialog> createState() => _SendContactDialogState();
}

class _SendContactDialogState extends State<SendContactDialog> {
  String text = "";

  @override
  void initState() {
    super.initState();
    text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: const Alignment(0, 0.85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: const BorderSide(color: Colors.black, width: 2.5),
      ),
      elevation: 16,
      child: SizedBox(
        width: 80.w,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 28),
              CustomTextFormField(
                keyboardType: widget.textInputType,
                autofocus: true,
                initialValue: text,
                // hintText:
                //     'changeNameHint'.tr(namedArgs: {'value1': widget.label}),
                hintText: widget.hint,
                onChanged: (val) {
                  EasyDebounce.debounce(
                    'nameselect',
                    const Duration(milliseconds: 50),
                    () {
                      setState(() {
                        text = val;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Todo remove Outlined Button and stay with Containers to keep it the same everywhere - Extract Cancel Widget and Save Widget
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      side: BorderSide(
                        width: 0.5,
                        color: getCustomColors(context).lightBorder ??
                            Colors.transparent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "changeNameCancel".tr(),
                      style: getCustomTextStyles(context)
                          .dataEditDialogButtonCancelStyle,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context, text),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      backgroundColor: getCustomColors(context).accent,
                      side: BorderSide(
                        width: 0.5,
                        color: getCustomColors(context).lightBorder ??
                            Colors.transparent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      widget.confirmLabel,
                      style: getCustomTextStyles(context)
                          .dataEditDialogButtonSaveStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
