import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import '../../src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import '../../utils/api_constants.dart';
import '../../utils/snak_bar_widget.dart';
import '../../utils/text_utils.dart';
import '../hive_local_storage.dart';
import '../internet_interceptor.dart';

class DioServices {
  static final DioServices _dioServices = DioServices._internal();

  factory DioServices() {
    return _dioServices;
  }

  DioServices._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: const Duration(milliseconds: 6000)));
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
    ));

    InternetInterceptor(
      requestRetrier: DioConnectivityRequestRetrier(
        dio: dio,
        connectivity: Connectivity(),
      ),
    );
  }

  late Dio dio;
  var token = "195|5PxDxxPjHQ8GwVGUYhSKCAR1jNYWHYqPHr2H5pqq";

  Future<Response> post(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        "x-api-channel": "getpaid-app",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.post(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    } on DioError catch (e) {
      bool noInternet = e.error is SocketException;
      log("No internet==>$noInternet");
      log(e.toString());
      if (!noInternet && e.response!.statusCode == 401) {
        log(e.toString());
        toRemoveAll(
            context: navstate.currentState!.context,
            widget: const RecruiterSignInScreen());
        showErrorSnackBarMessage(message: "Session Expired!Please Login again");
        // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
        //     .go(LoginScreen.route);
        // Utils.pushAndRemoveUntil(page: const SignInScreen());
        throw ('User not authorised. Please login again');
      }
      if (noInternet) {
        log('Timeout');
        throw ('No internet connection');
      }
      if (e.response?.data != null) {
        log(e.response!.data.toString());
        throw (e.response!.data);
      }
      return e.response!;
    }
  }

  Future<Response> postAuth(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        "x-api-channel": "getpaid-app",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.post(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on DioError catch (e) {
      // showErrorSnackBarMessage(message: e.message.toString());
      // print(e.response!.statusMessage.toString());

      return e.response!;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    }
  }

  Future<Response> putAuth(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        "x-api-channel": "getpaid-app",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.put(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on DioError catch (e) {
      // showErrorSnackBarMessage(message: e.message.toString());
      // print(e.response!.statusMessage.toString());

      return e.response!;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    }
  }

  Future<Response> delete(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        "x-api-channel": "getpaid-app",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.delete(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on DioError catch (e) {
      // showErrorSnackBarMessage(message: e.message.toString());
      // print(e.response!.statusMessage.toString());

      return e.response!;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    }
  }

  Future<Response> get(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    String userToken = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
        ) ??
        '';
    try {
      var headers = {
        "Accept": "application/json",
        "x-api-channel": "getpaid-app",
        'Authorization': 'Bearer $userToken',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.get(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on SocketException catch (e) {
      log('Timeout');
      // showErrorSnackBarMessage(
      //   message: "No internet connection",
      // );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    } on DioError catch (e) {
      bool noInternet = e.error is SocketException;
      log("No internet==>$noInternet");
      log(e.toString());
      if (!noInternet && e.response!.statusCode == 401) {
        log(e.toString());

        // GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
        //     .go(LoginScreen.route);

        toNext(
            context: navstate.currentState!.context,
            widget: const RecruiterSignInScreen());
        showErrorSnackBarMessage(
            message: "Sesstion Expired Please LogIn Again");
        showErrorSnackBarMessage(message: "Session Expired!Please Login again");
        // Utils.pushAndRemoveUntil(page: const SignInScreen());
        throw ('User not authorised. Please login again');
      }
      if (noInternet) {
        log('Timeout');
        throw ('No internet connection');
      }
      if (e.response?.data != null) {
        log(e.response!.data.toString());
        throw (e.response!.data);
      }
      return e.response!;
    }
  }
}
