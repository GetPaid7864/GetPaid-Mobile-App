import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/textfield_widget.dart';
import 'package:get_paid/src/jobSeekerModule/backgroundCheckSection/screens/stepThree_screen.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../widgets/custom_stepper_widget.dart';

class StepTwoScreen extends StatefulWidget {
  const StepTwoScreen({Key? key}) : super(key: key);

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController transitNumberController = TextEditingController();
  TextEditingController institutionNumberController = TextEditingController();
  TextEditingController institutionNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: CommonButtonWidget(
                      text: "Cancel",
                      horizontalPadding: 0,
                      bordercolor: AppColors.greyColor.withOpacity(0.3),
                      textcolor: AppColors.blackColor,
                      backgroundcolor: AppColors.whitecolor,
                      onTap: () {
                        Navigator.maybePop(context);
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CommonButtonWidget(
                      text: "Save & Next",
                      horizontalPadding: 0,
                      bordercolor: AppColors.appcolor,
                      backgroundcolor: AppColors.appcolor,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          toNext(
                              context: context,
                              widget: const StepThreeScreen());
                        }
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FrontEndTextUtils.backgroundChek,
                  style: fontW7S12(context)!
                      .copyWith(fontSize: 23, fontWeight: FontWeight.w700),
                ),
                Text(
                  "2/3",
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
            CustomStepperWidget(
              color1: AppColors.appcolor,
              color2: AppColors.appcolor,
              color3: AppColors.greyColor.withOpacity(0.4),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                FrontEndTextUtils.setupyourbankaccount,
                style: fontW7S12(context)!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                      controller: accountNumberController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      toppadding: 15,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Account Number";
                        }
                      },
                      hintText: "Account Number",
                      textInputType: TextInputType.number),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFieldWidget(
                      controller: transitNumberController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      toppadding: 15,
                      hintText: "Transit Number",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Transit Number";
                        }
                      },
                      textInputType: TextInputType.number),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFieldWidget(
                      controller: institutionNumberController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      toppadding: 15,
                      hintText: "Institution Number",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Institution Number";
                        }
                      },
                      textInputType: TextInputType.number),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFieldWidget(
                      controller: institutionNameController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      toppadding: 15,
                      hintText: "Institution Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Institution Name";
                        }
                      },
                      textInputType: TextInputType.name)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
