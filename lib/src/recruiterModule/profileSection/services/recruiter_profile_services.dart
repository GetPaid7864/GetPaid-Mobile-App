import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/profileSection/models/recruiter_profile_model.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class RecruiterProfileServices {
  DioServices dioServices = DioServices();

  ///get all recruiter profile data
  Future<GetRecruiterProfileModel?> getAllRecruiterProfileData() async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    Response? response =
        await dioServices.get(Apis.getRecruiterProfile + recruiterUserID);
    //var jsonResponse = jsonDecode(response.data);

    if (response!.statusCode == 200) {
      dp(msg: "response data", arg: response.data);
    } else {}

    // return
    return GetRecruiterProfileModel.fromJson(response.data);
  }
}
