import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/models/add_laguage_model.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/screens/steps/add_contact_details_step_two.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/screens/steps/add_education_step_four.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/screens/steps/add_languages.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class JobSeekerProfileSetupServices {
  DioServices dioServices = DioServices();

  ///posting create job api request
  Future<Response?> addPersonalInfo(
    String firstNameController,
    String lastNameController,
    String jobTitleController,
    final String dateOfBirth,
  ) async {
    var jobSeekerID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    Map<String, dynamic> variables = {
      "jobSeekerId": "64840b911eb119ddb94b08b4",
      "personalInfo[firstName]": firstNameController,
      "personalInfo[lastName]": lastNameController,
      "personalInfo[dob]": dateOfBirth,
      "personalInfo[jobTitle]": jobTitleController,
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.putAuth(Apis.updateJobSeeker, body: body
            //     body: {
            //   "jobSeekerId": jobSeekerID,
            //   "personalInfo[firstName]": firstNameController,
            //   "personalInfo[lastName]": lastNameController,
            //   "personalInfo[dob]": dateOfBirth,
            //   "personalInfo[jobTitle]": jobTitleController,
            // }

            );
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Personal Info Added Successfully");
      toRemoveAll(
          context: navstate.currentState!.context,
          widget: AddContactDetailsStepTwo());
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting create job api request
  Future<Response?> addContactDetails(
    String phoneNumber,
    String email,
    String city,
    String state,
    String zipCode,
  ) async {
    var jobSeekerID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    Map<String, dynamic> variables = {
      "jobSeekerId": "64840b911eb119ddb94b08b4",
      "contact[phoneNumber]": phoneNumber,
      "contact[email]": email,
      "contact[city]": city,
      "contact[state]": state,
      "contact[zipCode]": zipCode,
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.putAuth(Apis.updateJobSeeker, body: body);
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Contact Details Added Successfully");
      toRemoveAll(
          context: navstate.currentState!.context,
          widget: const AddLanguagesStepThree());
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting profile image
  Future<Response?> uploadProfileImage(
    File image,
  ) async {
    var jobSeekerID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    String fileName = image.path.split('/').last;
    Map<String, dynamic> variables = {
      "jobSeekerId": "64840b911eb119ddb94b08b4",
      "photo": await MultipartFile.fromFile(image.path, filename: fileName),
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.putAuth(Apis.updateJobSeeker, body: body);
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(
          content: "Profile Image Uploaded Successfully");
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting to add languages
  Future<Response?> addLanguages(
    List<AddLanguageModel> addLanguageModellist,
    // String language,
    // String level,
  ) async {
    var jobSeekerID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );

    FormData formData = FormData();
    formData.fields
        .add(const MapEntry('jobSeekerId', "64840b911eb119ddb94b08b4"));

    for (int i = 0; i < addLanguageModellist.length; i++) {
      //formData.fields.add(MapEntry("jobSeekerId", "64840b911eb119ddb94b08b4"));
      formData.fields.add(MapEntry(
          'languages[$i][language]', addLanguageModellist[i].language));
      formData.fields.add(MapEntry(
          'languages[$i][level]', addLanguageModellist[i].level.toString()));
    }

    // Map<String, dynamic> variables = {
    //   "jobSeekerId": "64840b911eb119ddb94b08b4",
    //   "languages": addLanguageModel,
    //   //"languages[0][level]": level,
    // };
    // log(variables.toString());
    // FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.putAuth(Apis.updateJobSeeker, body: formData);
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Languages Added Successfully");
      toRemoveAll(
          context: navstate.currentState!.context,
          widget: const AddEducationStepFour());
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }
}
