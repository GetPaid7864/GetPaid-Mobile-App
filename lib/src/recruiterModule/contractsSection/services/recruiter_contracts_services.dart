import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/models/recruiter_contract_details_model.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/models/recruiter_contracts_model.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';

class RecruiterContractsService {
  DioServices dioServices = DioServices();

  ///get all contacts of recruiter

  Future<RecruiterContractsModel?> getContractsOfRecruiter() async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    dp(msg: "recruiter user id", arg: recruiterUserID);

    Response? response =
        await dioServices.get(Apis.getRecruiterContracts + recruiterUserID);
    // var jsonResponse = jsonDecode(response.data);
    if (response.statusCode == 200) {
      dp(msg: "recruiter contracts data", arg: response.data);
    } else {}

    // return
    return RecruiterContractsModel.fromJson(response.data);
  }

  ///get  contact detail of recruiter

  Future<RecruiterContractDetailsModel?> getContractDetailsOfRecruiter(
      String contractID) async {
    dp(msg: "Contract id", arg: contractID);

    Response? response =
        await dioServices.get(Apis.getRecruiterContractDetails + contractID);
    // var jsonResponse = jsonDecode(response.data);
    if (response.statusCode == 200) {
      dp(msg: "recruiter contracts details data", arg: response.data);
    } else {}

    // return
    return RecruiterContractDetailsModel.fromJson(response.data);
  }
}
