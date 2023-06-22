import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/models/jobseeker_proposal_model.dart';

import '../../../../helpers/ApiHelpers/dio_service.dart';
import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';
import '../../dashboardSection/models/jobseeker_dashboard_model.dart';
import '../screens/proposal_submitted_sucessfully_screen.dart';

class JobSeekerProposalServices {
  DioServices dioServices = DioServices();

  ///posting create job api request
  Future<Response?> createProposal(
    String recruiterId,
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
      "jobSeekerId": recruiterUserID,
      "jobId": jobId,
      "bidAmount": bidAmount,
      "time": time,
      "checkIn": checkIn,
      "checkInOccurrence": checkInOccurrence,
      "coverLetter": coverLetter,
      "type": "Submitted",
      "status": "Pending",
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response =
        await dioServices.postAuth(Apis.createProposal, body: body
            //     {
            //   "recruiterId": recruiterId,
            //   "jobSeekerId": recruiterUserID,
            //   "jobId": jobId,
            //   "bidAmount": bidAmount,
            //   "time": time,
            //   "checkIn": checkIn,
            //   "checkInOccurrence": checkInOccurrence,
            //   "coverLetter": coverLetter,
            //   "type": "Submitted",
            //   "status": "Saved",
            // }

            );
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      showSuccessSnackBarMessage(content: "Proposal Submitted Successfully");
      toRemoveAll(
          context: navstate.currentState!.context,
          widget: const ProposalSubmittedSuccessfully());
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

  Future<JobSeekerProposalModel?> getJobSeekerProposals() async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    dp(msg: "recruiter user id", arg: recruiterUserID);

    Response? response =
        await dioServices.get(Apis.getProposalsOfJobSeeker + recruiterUserID);

    // var jsonResponse = jsonDecode(response.data);
    if (response.statusCode == 200) {
      dp(msg: "proposals data", arg: response.data);
    } else {}

    // return
    return JobSeekerProposalModel.fromJson(response.data);
  }
}
