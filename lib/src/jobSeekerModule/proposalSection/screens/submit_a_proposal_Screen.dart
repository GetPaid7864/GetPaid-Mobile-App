import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/providers/job_seeker_proposal_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/textfield_widget.dart';
import '../../../../helpers/date_formatter.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class SubmitProposalScreen extends StatefulWidget {
  final dynamic recentJob;

  const SubmitProposalScreen({Key? key, required this.recentJob})
      : super(key: key);

  @override
  State<SubmitProposalScreen> createState() => _SubmitProposalScreenState();
}

class _SubmitProposalScreenState extends State<SubmitProposalScreen> {
  TextEditingController bidAmountController = TextEditingController();
  TextEditingController dummyController2 = TextEditingController();
  TextEditingController timeFrameController = TextEditingController();
  TextEditingController dummyController = TextEditingController();

  TextEditingController coverLetterController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerProposalProvider>(
        builder: (context, jobSeekerProposalProvider, __) {
      return LoadingOverlay(
        isLoading: jobSeekerProposalProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 32,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
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
                              text: "Discard",
                              backgroundcolor: AppColors.lightRedColor,
                              horizontalPadding: 0,
                              textcolor: AppColors.redColor,
                              textfont: 14,
                              onTap: () async {
                                Navigator.maybePop(context);
                              })),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CommonButtonWidget(
                              text: "Submit Proposal",
                              backgroundcolor: AppColors.appcolor,
                              horizontalPadding: 0,
                              textfont: 14,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  jobSeekerProposalProvider
                                      .sendCreateJobRequest(
                                          widget.recentJob.postedBy!.id
                                              .toString(),
                                          widget.recentJob.id.toString(),
                                          bidAmountController.text,
                                          coverLetterController.text);
                                }
                              }))
                    ],
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
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
                              "Apply",
                              style: fontW7S12(context)!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
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
                              "Submit a Proposal",
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    "Job Details",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 165,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: AppColors.lightGrey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.recentJob.title.toString(),
                                    //   "",
                                    // "Creative UI UX Designer",
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,

                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        // widget.active.createdAt!.format("Y-M-d   h:i A"),
                                        "Fixed Price: \$${widget.recentJob.salary}",
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,

                                          color: AppColors.appcolor
                                              .withOpacity(0.8),
                                          //decoration: TextDecoration.underline
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        DateFormatter.dateFormatter(
                                            widget.recentJob.createdAt!),
                                        //"1 min ago",
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,

                                          color: AppColors.greyColor
                                              .withOpacity(0.8),
                                          //decoration: TextDecoration.underline
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //   SvgPicture.asset("assets/images/morevert.svg"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Description",
                            style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,

                              color: AppColors.greyColor.withOpacity(0.8),
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: RichText(
                                text: TextSpan(
                              style: fontW7S12(context)!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.blackColor.withOpacity(0.7),
                              ),
                              text: widget.recentJob.description.toString(),
                            ))
                            //"We are looking for a Creative UI UX Designer who can  looking landing page to an elegant and modern User Interface.")),
                            ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: AppColors.greyColor.withOpacity(0.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Status",
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,

                                      color:
                                          AppColors.greyColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.recentJob.status.toString(),
                                    // widget.active.status.toString(),
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,

                                      color:
                                          widget.recentJob.status.toString() ==
                                                  "Active"
                                              ? AppColors.appcolor
                                              : AppColors.redColor,
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 1,
                                color: AppColors.greyColor.withOpacity(0.4),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Type",
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,

                                      color:
                                          AppColors.greyColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    widget.recentJob.workplace.toString(),
                                    // widget.active.workplace.toString(),
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,

                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 1,
                                color: AppColors.greyColor.withOpacity(0.4),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Job Location",
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,

                                      color:
                                          AppColors.greyColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.recentJob.jobLocation.toString(),
                                    // widget.active.jobLocation.toString(),
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,

                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                            controller: bidAmountController,
                            textFieldHeight: 55,
                            maxlines: 1,
                            title: "Bid Amount",
                            showtitle: true,
                            hintText: "Enter Bid Amount",
                            toppadding: 15,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Bid Amount";
                              }
                            },
                            textInputType: TextInputType.number),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Requires Check In?",
                              style: fontW7S12(context)!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: AppColors.greyColor),
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                activeColor: AppColors.appcolor,
                                inactiveThumbColor: AppColors.blackColor,
                                inactiveTrackColor:
                                    AppColors.greyColor.withOpacity(0.5),
                                activeTrackColor:
                                    AppColors.greyColor.withOpacity(0.5),
                                value: jobSeekerProposalProvider.isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    jobSeekerProposalProvider.isSwitched =
                                        value;
                                    dp(
                                        msg: "require check in status",
                                        arg: jobSeekerProposalProvider
                                            .isSwitched);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 130),
                                  child: SizedBox(
                                    height: 300,
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Consumer<
                                              JobSeekerProposalProvider>(
                                          builder: (context,
                                              jobSeekerProposalProvider, __) {
                                        return AlertDialog(
                                          backgroundColor: AppColors.whitecolor,
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Choose",
                                                style: fontW7S12(context)!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                        color: AppColors
                                                            .blackColor),
                                              ),
                                            ],
                                          ),
                                          content: Column(
                                            children: [
                                              SizedBox(
                                                width: double.maxFinite,
                                                height: 260,
                                                child: ListView.builder(
                                                  itemCount:
                                                      jobSeekerProposalProvider
                                                          .checkInOcurrencelist
                                                          .length,
                                                  // Replace `myList` with your own list of data
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    // Use the `index` to access the current item in the list
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 7),
                                                      child: InkWell(
                                                        onTap: () {
                                                          jobSeekerProposalProvider
                                                              .updateData(
                                                                  index);
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9),
                                                              color: index ==
                                                                      jobSeekerProposalProvider
                                                                          .index
                                                                  ? AppColors
                                                                      .appcolor
                                                                  : AppColors
                                                                      .whitecolor),
                                                          child: Center(
                                                            child: Text(
                                                              jobSeekerProposalProvider
                                                                  .checkInOcurrencelist[
                                                                      index]
                                                                  .toString(),
                                                              style: fontW7S12(context)!.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12,
                                                                  color: index ==
                                                                          jobSeekerProposalProvider
                                                                              .index
                                                                      ? AppColors
                                                                          .whitecolor
                                                                      : AppColors
                                                                          .blackColor),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                    }),
                                  ),
                                );
                              },
                            );
                          },
                          child: TextFieldWidget(
                              controller: dummyController,
                              textFieldHeight: 55,
                              maxlines: 1,
                              enabled: false,
                              hintText:
                                  jobSeekerProposalProvider.selectedOption ==
                                          null
                                      ? "Please Choose"
                                      : jobSeekerProposalProvider.selectedOption
                                          .toString(),
                              title: "Check-in Occurrence",
                              showtitle: true,
                              toppadding: 24,
                              showSuffixIcon: true,
                              suffixIcon:
                                  const Icon(Icons.arrow_drop_down_outlined),
                              textInputType: TextInputType.text),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  jobSeekerProposalProvider
                                      .selectStartTime(context);
                                },
                                child: TextFieldWidget(
                                    controller: timeFrameController,
                                    textFieldHeight: 55,
                                    maxlines: 1,
                                    title: " Job Start Time",
                                    showtitle: true,
                                    hintText: jobSeekerProposalProvider
                                                .selectedStartTime ==
                                            null
                                        ? "Start Time"
                                        : "${jobSeekerProposalProvider.selectedStartTime!.hour}:${jobSeekerProposalProvider.selectedStartTime!.minute} ${jobSeekerProposalProvider.selectedStartTime!.period.name.toString().toUpperCase()}",
                                    toppadding: 24,
                                    showSuffixIcon: true,
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    enabled: false,
                                    textInputType: TextInputType.text),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  jobSeekerProposalProvider
                                      .selectEndTime(context);
                                },
                                child: TextFieldWidget(
                                    controller: timeFrameController,
                                    textFieldHeight: 55,
                                    maxlines: 1,
                                    title: "Job End Time",
                                    showtitle: true,
                                    hintText: jobSeekerProposalProvider
                                                .selectedEndTime ==
                                            null
                                        ? "End Time"
                                        : "${jobSeekerProposalProvider.selectedEndTime!.hour}:${jobSeekerProposalProvider.selectedEndTime!.minute} ${jobSeekerProposalProvider.selectedEndTime!.period.name.toString().toUpperCase()}",
                                    toppadding: 24,
                                    showSuffixIcon: true,
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    enabled: false,
                                    textInputType: TextInputType.text),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                            controller: coverLetterController,
                            textFieldHeight: 150,
                            maxlines: 18,
                            title: "Cover Letter",
                            showtitle: true,
                            hintText: "Cover Letter",
                            toppadding: 15,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Cover Letter";
                              }
                            },
                            textInputType: TextInputType.text),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
