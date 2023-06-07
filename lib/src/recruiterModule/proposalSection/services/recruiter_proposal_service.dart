import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class RecruiterProposalServices {
  DioServices dioServices = DioServices();

  ///get recruioter  job proposals
  Future<RecruiterProposalModel?> getRecruiterJobProposals(String jobID) async {
    // dp(msg: "job id to get job proposals", arg: jobID);
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    dp(msg: "recruiter user id", arg: recruiterUserID);

    Response? response =
        await dioServices.get(Apis.getRecruiterJobProposals + recruiterUserID);
    //var jsonResponse = jsonDecode(response.data);

    if (response!.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return RecruiterProposalModel.fromJson(response.data);
  }
}
