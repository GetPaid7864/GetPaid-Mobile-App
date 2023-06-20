import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:get_paid/utils/validator_helpoers.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../helpers/showsnackbar.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../widgets/custom_textfield_profile_widget.dart';
import '../../widgets/custome_stepper_widget_profile_setup.dart';

class AddContactDetailsStepTwo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddContactDetailsStepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerProfileSetupProvider>(
        builder: (context, jobSeekerProfileSetupProvider, __) {
      return LoadingOverlay(
        isLoading: jobSeekerProfileSetupProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 32,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          backgroundColor: AppColors.fillColor,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: AppColors.fillColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                          child: CommonButtonWidget(
                              text: "Cancel",
                              backgroundcolor: AppColors.whitecolor,
                              horizontalPadding: 0,
                              bordercolor: AppColors.greyColor.withOpacity(0.7),
                              textcolor: AppColors.blackColor,
                              textfont: 14,
                              onTap: () async {})),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CommonButtonWidget(
                              text: "Save & Next",
                              backgroundcolor: AppColors.appcolor,
                              bordercolor: AppColors.appcolor,
                              horizontalPadding: 0,
                              textfont: 14,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  jobSeekerProfileSetupProvider
                                      .addContactDetailsProvider();
                                }
                              }))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile Setup",
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 21, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "2/6",
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 17,
                            color: AppColors.appcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomStepperProfileSetupWidget(
                    color1: AppColors.greyColor.withOpacity(0.6),
                    color2: AppColors.appcolor,
                    color3: AppColors.greyColor.withOpacity(0.6),
                    color4: AppColors.greyColor.withOpacity(0.6),
                    color5: AppColors.greyColor.withOpacity(0.6),
                    color6: AppColors.greyColor.withOpacity(0.6),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Contact Details",
                    style: fontW7S12(context)!
                        .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomProfileTextFieldWidget(
                          controller:
                              jobSeekerProfileSetupProvider.emailController,
                          hinText: 'Email Address',
                          enabled: true,
                          suffixIcon: '',
                          validator: (value) {
                            return ValidatorHelpers.validateEmail(value);
                          },
                          showsuffixicon: false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.whitecolor,
                                  borderRadius: BorderRadius.circular(13)),
                              height: 50,
                              child: CountryCodePicker(
                                onChanged: (countryCode) {
                                  jobSeekerProfileSetupProvider.countryPicked =
                                      countryCode.dialCode;
                                  dp(
                                      msg: "country code",
                                      arg: countryCode.dialCode);
                                },
                                dialogTextStyle: const TextStyle(
                                    color: AppColors.blackColor),
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'CA',
                                // favorite: ['+39', 'FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                flagWidth: 30,
                                searchDecoration: const InputDecoration(
                                    hintText: "Search Country",
                                    border: UnderlineInputBorder(),
                                    hintStyle:
                                        TextStyle(color: AppColors.blackColor)),
                                searchStyle:
                                    TextStyle(color: AppColors.blackColor),
                                //  dialogBackgroundColor: AppColors.dashboardColor,

                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,

                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomProfileTextFieldWidget(
                                controller: jobSeekerProfileSetupProvider
                                    .phoneNumberController,
                                hinText: 'Phone Number',
                                enabled: true,
                                textInputType: TextInputType.phone,
                                onChanged: (value) {
                                  jobSeekerProfileSetupProvider
                                          .completePhoneNumber =
                                      jobSeekerProfileSetupProvider
                                              .countryPicked
                                              .toString() +
                                          value.toString();

                                  dp(
                                      msg: "complete phone number",
                                      arg: jobSeekerProfileSetupProvider
                                          .completePhoneNumber);
                                },

                                suffixIcon: '',
                                validator: (value) {
                                  return ValidatorHelpers.validatePhoneNumber(
                                      value);
                                },
                                //   if (value!.isEmpty) {
                                //     return "Please Enter Phone Number";
                                //   }
                                //   return null;
                                // },
                                showsuffixicon: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomProfileTextFieldWidget(
                          controller:
                              jobSeekerProfileSetupProvider.cityController,
                          hinText: 'City',
                          enabled: true,
                          suffixIcon: '',
                          showsuffixicon: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter City";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomProfileTextFieldWidget(
                          controller:
                              jobSeekerProfileSetupProvider.stateController,
                          hinText: 'State',
                          enabled: true,
                          suffixIcon: '',
                          showsuffixicon: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter State";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomProfileTextFieldWidget(
                          controller:
                              jobSeekerProfileSetupProvider.zipCodeController,
                          hinText: 'Zip Code',
                          enabled: true,
                          suffixIcon: '',
                          showsuffixicon: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Zip Code";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
