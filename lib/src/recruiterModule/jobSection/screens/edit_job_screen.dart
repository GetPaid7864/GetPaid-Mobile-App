import 'package:country_picker/country_picker.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/textfield_widget.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../providers/recruiter_jobs_provider.dart';

class RecruiterEditJobScreen extends StatefulWidget {
  final String jobID;

  const RecruiterEditJobScreen({Key? key, required this.jobID})
      : super(key: key);

  @override
  State<RecruiterEditJobScreen> createState() => _RecruiterEditJobScreenState();
}

class _RecruiterEditJobScreenState extends State<RecruiterEditJobScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeFrameController = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController dummyController = TextEditingController();
  TextEditingController dummyController2 = TextEditingController();
  TextEditingController descController = TextEditingController();

  TextEditingController skillsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initMethod();
    super.initState();
  }

  initMethod() async {
    await context
        .read<RecruiterJobsProvider>()
        .getRecruiterJobsDetailsProvider(widget.jobID);
    await Future.delayed(const Duration(seconds: 3));
    await getJobDataForEdit();
  }

  getJobDataForEdit() async {
    await setDataInController();
    await setOtherData();
  }

  setOtherData() {
    context.read<RecruiterJobsProvider>().setDateInTextFields();
  }

  setDataInController() {
    setState(() {
      titleController = TextEditingController(
          text: context
                  .read<RecruiterJobsProvider>()
                  .recruiterJobDetailsModel!
                  .data!
                  .title ??
              "");
      payController = TextEditingController(
          text: context
                  .read<RecruiterJobsProvider>()
                  .recruiterJobDetailsModel!
                  .data!
                  .salary ??
              "");
      descController = TextEditingController(
          text: context
                  .read<RecruiterJobsProvider>()
                  .recruiterJobDetailsModel!
                  .data!
                  .description ??
              "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterJobsProvider>(
        builder: (context, recruiterJobsProvider, __) {
      return LoadingOverlay(
        isLoading: recruiterJobsProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const Center(
          child: SpinKitPulse(
            size: 40,
            color: AppColors.appcolor,
          ),
        ),
        child: WillPopScope(
          onWillPop: () async {
            recruiterJobsProvider.cancelEditAndDiscard();
            return true;
          },
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
                                text: "Cancel",
                                textfont: 13,
                                backgroundcolor: AppColors.redColor,
                                horizontalPadding: 0,
                                onTap: () {
                                  Navigator.maybePop(context);
                                  recruiterJobsProvider.cancelEditAndDiscard();
                                  // recruiterJobsProvider.disCardJob();
                                })),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: CommonButtonWidget(
                                text: "Update Job",
                                textfont: 13,
                                backgroundcolor: AppColors.appcolor,
                                horizontalPadding: 0,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    recruiterJobsProvider.sendUpdateJobRequest(
                                        widget.jobID.toString(),
                                        titleController.text,
                                        payController.text,
                                        descController.text);
                                  }
                                }))
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: recruiterJobsProvider.recruiterJobDetailsModel == null
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 340),
                        child: SpinKitPulse(
                          size: 25,
                          color: AppColors.appcolor,
                        ),
                      ),
                    )
                  : Column(
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
                                    recruiterJobsProvider
                                        .cancelEditAndDiscard();
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                padding: const EdgeInsets.only(
                                    left: 12, right: 20, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Update A Job",
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22),
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                    controller: titleController,
                                    textFieldHeight: 55,
                                    maxlines: 1,
                                    hintText: "Title",
                                    title: "Job Title",
                                    showtitle: true,
                                    toppadding: 15,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Job Title";
                                      }
                                    },
                                    textInputType: TextInputType.text),
                                InkWell(
                                  onTap: () {
                                    recruiterJobsProvider.selectDate(context);
                                  },
                                  child: TextFieldWidget(
                                      controller: dummyController2,
                                      textFieldHeight: 55,
                                      maxlines: 1,
                                      enabled: false,
                                      title: "Choose Date",
                                      showtitle: true,
                                      suffixIcon:
                                          const Icon(Icons.date_range_sharp),
                                      showSuffixIcon: true,
                                      hintText: recruiterJobsProvider
                                                  .selectedDate ==
                                              null
                                          ? "Select Date"
                                          : recruiterJobsProvider.selectedDate!
                                              .format("d-M-Y"),
                                      toppadding: 24,
                                      textInputType: TextInputType.text),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          recruiterJobsProvider
                                              .selectStartTime(context);
                                        },
                                        child: TextFieldWidget(
                                            controller: timeFrameController,
                                            textFieldHeight: 55,
                                            maxlines: 1,
                                            title: " Job Start Time",
                                            showtitle: true,
                                            hintText: recruiterJobsProvider
                                                        .selectedStartTime ==
                                                    null
                                                ? "Start Time"
                                                : "${recruiterJobsProvider.selectedStartTime!.hour}:${recruiterJobsProvider.selectedStartTime!.minute} ${recruiterJobsProvider.selectedStartTime!.period.name.toString().toUpperCase()}",
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
                                          recruiterJobsProvider
                                              .selectEndTime(context);
                                        },
                                        child: TextFieldWidget(
                                            controller: timeFrameController,
                                            textFieldHeight: 55,
                                            maxlines: 1,
                                            title: "Job End Time",
                                            showtitle: true,
                                            hintText: recruiterJobsProvider
                                                        .selectedEndTime ==
                                                    null
                                                ? "End Time"
                                                : "${recruiterJobsProvider.selectedEndTime!.hour}:${recruiterJobsProvider.selectedEndTime!.minute} ${recruiterJobsProvider.selectedEndTime!.period.name.toString().toUpperCase()}",
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
                                  height: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Requires Check In?",
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: AppColors.greyColor),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Switch(
                                        activeColor: AppColors.appcolor,
                                        inactiveThumbColor:
                                            AppColors.blackColor,
                                        inactiveTrackColor: AppColors.greyColor
                                            .withOpacity(0.5),
                                        activeTrackColor: AppColors.greyColor
                                            .withOpacity(0.5),
                                        value: recruiterJobsProvider.isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            recruiterJobsProvider.isSwitched =
                                                value;
                                            dp(
                                                msg: "require check in status",
                                                arg: recruiterJobsProvider
                                                    .isSwitched);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 130),
                                          child: SizedBox(
                                            height: 300,
                                            width: 400,
                                            child:
                                                Consumer<RecruiterJobsProvider>(
                                                    builder: (context,
                                                        recruiterJobsProvider,
                                                        __) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    AppColors.whitecolor,
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Choose",
                                                      style: fontW7S12(context)!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                                      height: 280,
                                                      //height: 100,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            recruiterJobsProvider
                                                                .checkInOcurrencelist
                                                                .length,
                                                        // Replace `myList` with your own list of data
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          //  return Text("data");
                                                          // Use the `index` to access the current item in the list
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 7),
                                                            child: InkWell(
                                                              onTap: () {
                                                                recruiterJobsProvider
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
                                                                            recruiterJobsProvider
                                                                                .index
                                                                        ? AppColors
                                                                            .appcolor
                                                                        : AppColors
                                                                            .whitecolor),
                                                                child: Center(
                                                                  child: Text(
                                                                    recruiterJobsProvider
                                                                        .checkInOcurrencelist[
                                                                            index]
                                                                        .toString(),
                                                                    style: fontW7S12(context)!.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            12,
                                                                        color: index ==
                                                                                recruiterJobsProvider.index
                                                                            ? AppColors.whitecolor
                                                                            : AppColors.blackColor),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
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
                                      hintText: recruiterJobsProvider
                                                  .selectedOption ==
                                              null
                                          ? "Please Choose"
                                          : recruiterJobsProvider.selectedOption
                                              .toString(),
                                      title: "Check-in Occurrence",
                                      showtitle: true,
                                      toppadding: 24,
                                      showSuffixIcon: true,
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down_outlined),
                                      textInputType: TextInputType.text),
                                ),
                                TextFieldWidget(
                                    controller: payController,
                                    textFieldHeight: 55,
                                    maxlines: 1,
                                    title: "Pay/Salary",
                                    showtitle: true,
                                    hintText: "Pay/Salary",
                                    toppadding: 15,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Pay/Salary";
                                      }
                                    },
                                    textInputType: TextInputType.text),
                                InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      showPhoneCode: false,
                                      // optional. Shows phone code before the country name.
                                      onSelect: (Country country) {
                                        print(
                                            'Select country: ${country.name}');
                                        setState(() {
                                          recruiterJobsProvider
                                              .selectedCountry = country.name;
                                        });
                                      },
                                    );
                                  },
                                  child: TextFieldWidget(
                                      controller: dummyController,
                                      textFieldHeight: 55,
                                      maxlines: 1,
                                      hintText: recruiterJobsProvider
                                                  .selectedCountry ==
                                              null
                                          ? "Please Choose"
                                          : recruiterJobsProvider
                                              .selectedCountry
                                              .toString(),
                                      title: "Job Location",
                                      enabled: false,
                                      showSuffixIcon: true,
                                      suffixIcon: const Icon(Icons.location_on),
                                      showtitle: true,
                                      toppadding: 24,
                                      textInputType: TextInputType.text),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 200),
                                          child: SizedBox(
                                            height: 300,
                                            child:
                                                Consumer<RecruiterJobsProvider>(
                                                    builder: (context,
                                                        recruiterJobsProvider,
                                                        __) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    AppColors.whitecolor,
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Choose",
                                                      style: fontW7S12(context)!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                                      height: 130,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            recruiterJobsProvider
                                                                .workplaceList
                                                                .length,
                                                        // Replace `myList` with your own list of data
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          // Use the `index` to access the current item in the list
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 7),
                                                            child: InkWell(
                                                              onTap: () {
                                                                recruiterJobsProvider
                                                                    .updateDataOfWorkPlace(
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
                                                                            recruiterJobsProvider
                                                                                .indexOfWorkplace
                                                                        ? AppColors
                                                                            .appcolor
                                                                        : AppColors
                                                                            .whitecolor),
                                                                child: Center(
                                                                  child: Text(
                                                                    recruiterJobsProvider
                                                                        .workplaceList[
                                                                            index]
                                                                        .toString(),
                                                                    style: fontW7S12(context)!.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            12,
                                                                        color: index ==
                                                                                recruiterJobsProvider.indexOfWorkplace
                                                                            ? AppColors.whitecolor
                                                                            : AppColors.blackColor),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
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
                                      title: "Workplace",
                                      enabled: false,
                                      showSuffixIcon: true,
                                      suffixIcon:
                                          const Icon(Icons.arrow_drop_down),
                                      showtitle: true,
                                      hintText: recruiterJobsProvider
                                                  .selectedWorkPlace ==
                                              null
                                          ? "Please Choose"
                                          : recruiterJobsProvider
                                              .selectedWorkPlace
                                              .toString(),
                                      toppadding: 24,
                                      textInputType: TextInputType.text),
                                ),
                                // TextFieldWidget(
                                //     controller: dummyController,
                                //     textFieldHeight: 55,
                                //     maxlines: 1,
                                //     hintText: "Write Skills",
                                //
                                //     title: "Skills",
                                //     showtitle: true,
                                //     toppadding: 15,
                                //     textInputType: TextInputType.text),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Skills",
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 55,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.textfieldColor,
                                        borderRadius: BorderRadius.circular(9),
                                      ),

                                      child: TextFormField(
                                        // enableInteractiveSelection: true,

                                        //   scrollController: scrollController,
                                        onFieldSubmitted: (val) {
                                          recruiterJobsProvider
                                              .addSkillInList(val);
                                          dp(
                                              msg: "on field submitted",
                                              arg: val.toString());
                                          dp(
                                              msg: "skills list",
                                              arg: recruiterJobsProvider
                                                  .skillsList
                                                  .toString());
                                          skillsController.clear();
                                        },

                                        enableSuggestions: true,
                                        //   enableIMEPersonalizedLearning: true,
                                        autofocus: false,
                                        autocorrect: true,

                                        maxLength: 20,

                                        enabled: true,
                                        style: const TextStyle(
                                            // textStyle: Theme.of(context).textTheme.headline4,
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.blackColor),
                                        // inputFormatters: inputFormatters,
                                        onChanged: (val) {},
                                        // inputFormatters: <TextInputFormatter>[
                                        //   FilteringTextInputFormatter.allow(RegExp(r'^\d+(?:\.\d+)?$')),
                                        // ],
                                        controller: skillsController,

                                        keyboardType: TextInputType.text,
                                        maxLines: 1,
                                        //  validator: validator,
                                        // obscureText: obsecureText,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            counter: const SizedBox(),
                                            errorStyle: const TextStyle(
                                                height: 0.1, fontSize: 11),
                                            hintStyle: fontW4S12(context)!
                                                .copyWith(
                                                    color: AppColors.greyColor,
                                                    fontSize: 14),
                                            hintText: "Enter Skills",
                                            contentPadding: EdgeInsets.only(
                                                left: 15, top: 10, right: 5),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                if (recruiterJobsProvider
                                    .skillsList.isNotEmpty) ...[
                                  Container(
                                    height: 60,
                                    child: ListView.builder(
                                        itemCount: recruiterJobsProvider
                                            .skillsList.length,
                                        scrollDirection: Axis.horizontal,
                                        // Replace `myList` with your own list of data
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          // Use the `index` to access the current item in the list
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 10),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  height: 32,
                                                  //width: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      color: AppColors.greyColor
                                                          .withOpacity(0.5)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18),
                                                    child: Center(
                                                      child: Text(
                                                        recruiterJobsProvider
                                                            .skillsList[index]
                                                            .toString(),
                                                        style: fontW7S12(
                                                                context)!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    right: -1,
                                                    top: -1,
                                                    child: InkWell(
                                                      onTap: () {
                                                        recruiterJobsProvider
                                                            .removeSkillFromList(
                                                                index);
                                                      },
                                                      child: Container(
                                                        height: 17,
                                                        width: 17,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                            color: AppColors
                                                                .redColor),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 12,
                                                            color: AppColors
                                                                .whitecolor,
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ] else ...[
                                  SizedBox()
                                ],
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                    controller: descController,
                                    textFieldHeight: 100,
                                    maxlines: 5,
                                    title: "Description",
                                    showtitle: true,
                                    hintText: "Please Write Job Description",
                                    toppadding: 15,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Job Description";
                                      }
                                    },
                                    textInputType: TextInputType.text),
                                const SizedBox(
                                  height: 90,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
