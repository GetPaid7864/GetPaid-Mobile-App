import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/providers/bottom_navbar_provider.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/screens/bottomNavScreen.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/providers/recruiter_dashboard_provider.dart';
import 'package:get_paid/src/recruiterModule/jobSection/models/recruiter_all_jobs_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/models/recruiter_job_details_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/providers/recruiter_jobs_provider.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';

class RecruiterJobsServices {
  DioServices dioServices = DioServices();

  ///posting create job api request
  Future<Response?> createJob(
    String recruiterId,
    String title,
    String dates,
    String time,
    bool checkIn,
    String checkInOccurrence,
    String salary,
    String salaryFrequency,
    String jobLocation,
    String workplace,
    List skills,
    String description,
  ) async {
    Map<String, dynamic> variables = {
      "recruiterId": recruiterId,
      "title": title,
      "dates": dates,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "salary": salary,
      "salaryFrequency": salaryFrequency,
      "jobLocation": jobLocation,
      "workplace": workplace,
      "skills": skills,
      "description": description
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response = await dioServices.post(Apis.createJob, body: {
      "recruiterId": recruiterId,
      "title": title,
      "dates": dates,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "salary": salary,
      "salaryFrequency": salaryFrequency,
      "jobLocation": jobLocation,
      "workplace": workplace,
      "skills": skills,
      "description": description
    });
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Job Created Successfully");
      Navigator.maybePop(navstate.currentState!.context);
      Provider.of<RecruiterJobsProvider>(navstate.currentState!.context,
              listen: false)
          .disCardJob();
      Provider.of<RecruiterJobsProvider>(navstate.currentState!.context,
              listen: false)
          .getAllRecruiterJobsProvider();
      Provider.of<RecruiterDashBoardProviders>(navstate.currentState!.context,
              listen: false)
          .getRecruiterDashBoardDataProvider();
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting updating job api request
  Future<Response?> updateJob(
    String jobID,
    String title,
    String dates,
    String time,
    bool checkIn,
    String checkInOccurrence,
    String salary,
    String salaryFrequency,
    String jobLocation,
    String workplace,
    List skills,
    String description,
  ) async {
    Map<String, dynamic> variables = {
      "jobId": jobID,
      "title": title,
      "dates": dates,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "salary": salary,
      "salaryFrequency": salaryFrequency,
      "jobLocation": jobLocation,
      "workplace": workplace,
      "skills": skills,
      "description": description
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response = await dioServices.putAuth(Apis.createJob, body: {
      "jobId": jobID,
      "title": title,
      "dates": dates,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "salary": salary,
      "salaryFrequency": salaryFrequency,
      "jobLocation": jobLocation,
      "workplace": workplace,
      "skills": skills,
      "description": description
    });
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Job updated Successfully");
      Navigator.maybePop(navstate.currentState!.context);
      Provider.of<RecruiterJobsProvider>(navstate.currentState!.context,
              listen: false)
          .getRecruiterJobsDetailsProvider(jobID);
      Provider.of<RecruiterDashBoardProviders>(navstate.currentState!.context,
              listen: false)
          .getRecruiterDashBoardDataProvider();

      Provider.of<RecruiterJobsProvider>(navstate.currentState!.context,
              listen: false)
          .cancelEditAndDiscard();
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///get all recruiter jobs
  Future<RecruiterAllJobsModel?> getAllRecruiterJobs() async {
    Response? response = await dioServices.get(Apis.getAllRecruiterJobs);
    //var jsonResponse = jsonDecode(response.data);

    if (response!.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return RecruiterAllJobsModel.fromJson(response.data);
  }

  ///get recruiter jobs details
  Future<RecruiterJobDetailsModel?> getrecruiterJobDetails(String jobID) async {
    dp(msg: "job id", arg: jobID);
    dp(msg: "request url", arg: Apis.getRecruiterJobDetails.toString());
    Response? response =
        await dioServices.get(Apis.getRecruiterJobDetails + jobID);
    //var jsonResponse = jsonDecode(response.data);

    if (response.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return RecruiterJobDetailsModel.fromJson(response.data);
  }

  Future<Response?> deleteJob(String jobID) async {
    Response? response =
        await dioServices.delete(Apis.deleteRecruiterJob + jobID);
    //var jsonResponse = jsonDecode(response.data);

    if (response!.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
      toNext(
          context: navstate.currentState!.context,
          widget: const BottomNavScreen());
      showSuccessSnackBarMessage(content: "Job Deleted Successfully");
      Provider.of<RecruiterDashBoardProviders>(navstate.currentState!.context,
              listen: false)
          .getRecruiterDashBoardDataProvider();
      Provider.of<BottomNavProvider>(navstate.currentState!.context,
              listen: false)
          .updateCurrentScreen(2);
    } else {}
    // return response.data;
  }
}
