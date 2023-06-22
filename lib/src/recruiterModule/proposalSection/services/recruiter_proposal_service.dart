import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class RecruiterProposalServices {
  DioServices dioServices = DioServices();

  ///get recruioter  job proposals
  Future<RecruiterProposalModel?> getRecruiterJobProposals(String jobID) async {
    // dp(msg: "job id to get job proposals", arg: jobID);
    // String recruiterUserID = await HiveLocalStorage.readHiveValue(
    //   boxName: TextUtils.recruiterIDBox,
    //   key: TextUtils.recruiterIdKey,
    // );
    dp(msg: "jobId", arg: jobID);

    Response? response =
        await dioServices.get(Apis.getRecruiterJobProposals + jobID);
    //var jsonResponse = jsonDecode(response.data);

    if (response!.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return RecruiterProposalModel.fromJson(response.data);
  }

  ///update proposal to approved status
  Future<Response?> updateProposalFromPendingToApproved(
    String recruiterId,
    String jobSeekerID,
    String jobId,
    String bidAmount,
    String time,
    bool checkIn,
    String checkInOccurrence,
    String coverLetter,
  ) async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );

    dp(msg: "hive recruiter user id", arg: recruiterUserID.toString());
    Map<String, dynamic> variables = {
      "recruiterId": recruiterId,
      "jobSeekerId": jobSeekerID,
      "jobId": jobId,
      "bidAmount": bidAmount,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "coverLetter": coverLetter,
      "type": "Submitted",
      "status": "Shortlisted",
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.putAuth(Apis.updateProposalToApproved, body: body);
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Proposal Approved Successfully");

      // toRemoveAll(
      //     context: navstate.currentState!.context,
      //     widget: const ProposalSubmittedSuccessfully());
      //  Navigator.maybePop(navstate.currentState!.context);
      // Provider.of<RecruiterJobsProvider>(navstate.currentState!.context,
      //     listen: false)
      //     .disCardJob();
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }
}
