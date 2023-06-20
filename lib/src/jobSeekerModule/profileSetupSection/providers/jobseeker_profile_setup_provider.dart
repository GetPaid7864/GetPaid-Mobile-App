import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_paid/helpers/imagepickerhelper.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/models/add_laguage_model.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/services/jobseeker_profile_setup_services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';

class JobSeekerProfileSetupProvider extends ChangeNotifier {
  CroppedFile? croppedImage;

  DateTime? selectedDate;

  ///controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController dummyDOBController = TextEditingController();

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.whitecolor,
            title: const Text(
              "Choose Option",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(height: 1, color: Colors.black),
                  ListTile(
                    onTap: () {
                      pickProfileImage(context, ImageSource.gallery);
                      //_openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: AppColors.appcolor,
                    ),
                  ),
                  const Divider(height: 1, color: Colors.black),
                  ListTile(
                    onTap: () {
                      pickProfileImage(context, ImageSource.camera);
                      //  _openCamera(context);
                    },
                    title: const Text(
                      "Camera",
                    ),
                    leading:
                        const Icon(Icons.camera, color: AppColors.appcolor),
                  ),
                ],
              ),
            ),
          );
        });
  }

  pickProfileImage(context, ImageSource imageSource) async {
    croppedImage = null;
    var xFile = await ImageHelper.getImage(imageSource);

    if (xFile != null) {
      Navigator.pop(context);
      cropProfilePicFunc(
        image: File(xFile.path),
      );
      //profileImage = File(xFile.path);
      dp(msg: "image picked", arg: xFile.path);

      //  Navigator.maybePop(context);
      //uploadfiledio(firstName, lastName, phoneNumber);
      //updateMyProfileProvider(firstName, lastName, phoneNumber);
      // uploadBeforeTaskImageToServer(taskID);

      notifyListeners();
    } else {
      showErrorSnackBarMessage(
        content: "Picture not picked",
      );
    }
  }

  cropProfilePicFunc({
    required File image,
  }) async {
    croppedImage = await ImageCropper.platform.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        cropStyle: CropStyle.rectangle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Crop Profile Image",
            toolbarColor: AppColors.blackColor,
            showCropGrid: true,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ]);
    if (croppedImage != null) {
      updateProfileImageProvider(File(croppedImage!.path));
      // uploadfiledio(firstName, lastName, phoneNumber);
    }
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity
                .adaptivePlatformDensity, // colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      notifyListeners();
      dp(msg: "selected date", arg: selectedDate.toString());
    }
  }

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  JobSeekerProfileSetupServices jobSeekerProfileSetupServices =
      JobSeekerProfileSetupServices();

  updateProfileImageProvider(
    File? file,
  ) async {
    try {
      //  await Future.delayed(Duration(milliseconds: 50));
      makeLoadingTrue();

      jobSeekerProfileSetupServices
          .uploadProfileImage(
        file!,
      )
          .whenComplete(() {
        makeLoadingFalse();
        // getUserProfileProvider();
      });

      notifyListeners();
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(content: e.toString());
      // TODO
    }
  }

  ///add personal info provider
  addPersonalInfoProvider() async {
    try {
      if (selectedDate == null) {
        showErrorSnackBarMessage(content: "Please Choose Date Of Birth");
      } else {
        makeLoadingTrue();
        jobSeekerProfileSetupServices
            .addPersonalInfo(firstNameController.text, lastNameController.text,
                jobTitleController.text, selectedDate.toString())
            .whenComplete(() {
          makeLoadingFalse();
          // getAllRecruiterJobsProvider();
          // disCardJob();
        });

        notifyListeners();
      }
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  String? countryPicked;
  String? completePhoneNumber;

  ///add contact details provider
  addContactDetailsProvider() async {
    try {
      makeLoadingTrue();
      jobSeekerProfileSetupServices
          .addContactDetails(
              completePhoneNumber.toString(),
              emailController.text,
              cityController.text,
              stateController.text,
              zipCodeController.text)
          .whenComplete(() {
        makeLoadingFalse();
        // getAllRecruiterJobsProvider();
        // disCardJob();
      });

      notifyListeners();
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }

  final List<String> proficiencyLevel = [
    'Conversational',
    'Fluent',
    'Native',
  ];

  int? index;

  String? selectedProficiencyLevel;

  updateData(int indexComing) {
    index = indexComing;

    selectedProficiencyLevel = proficiencyLevel[indexComing].toString();
    notifyListeners();
    dp(msg: "selected option", arg: selectedProficiencyLevel.toString());
  }

  ///add languages step 3

  List<AddLanguageModel> languageList = [];

  addLanguageDataToList(String language, String level) {
    languageList.add(AddLanguageModel(language: language, level: level));

    notifyListeners();
  }

  removeLanguageDataToList(int index) {
    languageList.removeAt(index);

    notifyListeners();
  }

  ///add languages provider
  addLanguagesProvider() async {
    if (languageList.isEmpty) {
      showErrorSnackBarMessage(content: "Please Add least one language");
    } else {
      //   dp(msg: "language", arg: element.language);
      //    dp(msg: "level", arg: element.level);
      try {
        makeLoadingTrue();
        jobSeekerProfileSetupServices
            .addLanguages(languageList
                // completePhoneNumber.toString(),
                // emailController.text,
                )
            .whenComplete(() {
          makeLoadingFalse();
          // getAllRecruiterJobsProvider();
          // disCardJob();
        });

        notifyListeners();
      } on Exception catch (e) {
        makeLoadingFalse();
        showErrorSnackBarMessage(
          content: e.toString(),
        );
        // TODO
      }
    }
  }

  ///select education starting date

  DateTime? educationStartingDate;
  DateTime? educationEndingDate;

  Future<void> selectEducationStartingDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            backgroundColor: AppColors.whitecolor,
            colorScheme: ColorScheme.light(
                primary: AppColors.appcolor,
                background: AppColors.whitecolor,
                secondary: AppColors.whitecolor // Set your desired color
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      educationStartingDate = picked;
      notifyListeners();
    }
  }

  Future<void> selectEducationEndingDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            backgroundColor: AppColors.whitecolor,
            colorScheme: ColorScheme.light(
                primary: AppColors.appcolor,
                background: AppColors.whitecolor,
                secondary: AppColors.whitecolor // Set your desired color
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      educationEndingDate = picked;
      notifyListeners();
    }
  }
}
