import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/Models/recruiter_dashboard_model.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class RecruiterDashBoardServices {
  DioServices dioServices = DioServices();

  ///get all dashboard data

  Future<RecruiterDashBoardModel?> getAllDashBoardData() async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    dp(msg: "recruiter user id", arg: recruiterUserID);

    Response? response =
        await dioServices.get(Apis.getDashBoardData + recruiterUserID);
    // var jsonResponse = jsonDecode(response.data);
    if (response!.statusCode == 200) {
      dp(msg: "dashboard data", arg: response.data);
    } else {}

    // return
    return RecruiterDashBoardModel.fromJson(response.data);
  }
}
