import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/textfield_widget.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class PostAJobScreen extends StatefulWidget {
  const PostAJobScreen({Key? key}) : super(key: key);

  @override
  State<PostAJobScreen> createState() => _PostAJobScreenState();
}

class _PostAJobScreenState extends State<PostAJobScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeFrameController = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController dummyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            color: AppColors.blackColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Discard Job",
                          textfont: 13,
                          backgroundcolor: AppColors.redColor,
                          horizontalPadding: 0,
                          onTap: () {})),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Post Job",
                          textfont: 13,
                          backgroundcolor: AppColors.appcolor,
                          horizontalPadding: 0,
                          onTap: () {}))
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  focalRadius: 0.9,
                  tileMode: TileMode.clamp,
                  colors: [
                    AppColors.lightGrey.withOpacity(0.1),
                    AppColors.appcolor.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello Recruiter",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Post A Job",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFieldWidget(
                      controller: titleController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Title",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: timeFrameController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Time Frame",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: timeFrameController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Pay/Salary",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: dummyController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Daily / Weekly / Monthly",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: dummyController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Job Location",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: dummyController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Workplace",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: dummyController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      hintText: "Skills",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: dummyController,
                      textFieldHeight: 100,
                      maxlines: 5,
                      hintText: "Description",
                      toppadding: 15,
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
