import 'package:dio/dio.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/models/job_seeker_profile_model.dart';

import '../../../../helpers/ApiHelpers/dio_service.dart';
import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class JobSeekerProfileServices {
  DioServices dioServices = DioServices();

  ///get all recruiter profile data
  Future<JobSeekerProfileModel?> getAllJobSeekerProfileData() async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    Response? response =
        await dioServices.get(Apis.getJobSeekerProfile + recruiterUserID);
    //var jsonResponse = jsonDecode(response.data);

    if (response.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return JobSeekerProfileModel.fromJson(response.data);
  }
}
