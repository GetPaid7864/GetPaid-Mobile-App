import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/providers/authProvider.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';

class JobSeekerPhoneTextFieldWidget extends StatelessWidget {
  final String icon;
  final String headingName;
  final String hintName;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  // final TextEditingController? controller;

  const JobSeekerPhoneTextFieldWidget({
    Key? key,
    required this.icon,
    required this.headingName,
    required this.hintName,
    required this.textInputType,
    this.validator,
    //this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerAuthProvider>(
        builder: (context, jobSeekerAuthProvider, __) {
      return Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.textfieldColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            children: [
              CountryCodePicker(
                onChanged: (countryCode) {
                  jobSeekerAuthProvider.countryPicked = countryCode.dialCode;
                  dp(msg: "country code", arg: countryCode.dialCode);
                },
                dialogTextStyle: TextStyle(color: AppColors.blackColor),
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'PK',
                // favorite: ['+39', 'FR'],
                // optional. Shows only country name and flag
                showCountryOnly: false,
                flagWidth: 30,
                searchDecoration: const InputDecoration(
                    hintText: "Search Country",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: AppColors.blackColor)),
                searchStyle: TextStyle(color: AppColors.blackColor),
                //  dialogBackgroundColor: AppColors.dashboardColor,

                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,

                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
              // Expanded(
              //   flex: 3,
              //   child: InkWell(
              //     onTap: () {
              //       // showCountryPicker(
              //       //   context: context,
              //       //   showPhoneCode: true,
              //       //   // optional. Shows phone code before the country name.
              //       //   onSelect: (Country country) {
              //       //     print('Select country: ${country.e164Key}');
              //       //   },
              //       // );
              //     },
              //     child: Container(
              //       height: 42,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(13),
              //           color: AppColors.whiteColor),
              //       child: Center(
              //         child: Row(
              //           children: [
              //             Text(
              //               authProvider.countryPicked == null
              //                   ? "+92"
              //                   : "+${authProvider.countryPicked}",
              //               style: fontW5S12(context)!.copyWith(
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                   color: AppColors.blackColor),
              //             ),
              //             const Icon(
              //               Icons.arrow_drop_down,
              //               color: AppColors.applightcolor,
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 14,
                child: TextFormField(
                  //controller: controller,
                  keyboardType: textInputType,
                  validator: validator,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('^0')),
                  ],
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: true,

                  onChanged: (val) {
                    jobSeekerAuthProvider.userNumber = "+92$val";

                    var countryCode =
                        jobSeekerAuthProvider.countryPicked ?? "+92";
                    jobSeekerAuthProvider.completeUserNumber =
                        "$countryCode$val";

                    dp(
                        msg: "complete user number",
                        arg: jobSeekerAuthProvider.completeUserNumber);
                    // authProvider.userNumber =
                    //     authProvider.countryPicked + val;
                    dp(
                        msg: "phone number",
                        arg: jobSeekerAuthProvider.userNumber);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0, bottom: 5),
                      hintText: hintName,
                      counterText: "",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.blackColor.withOpacity(0.3)),
                      border: InputBorder.none),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
