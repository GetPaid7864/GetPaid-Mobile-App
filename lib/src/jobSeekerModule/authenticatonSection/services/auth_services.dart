class AuthServices {
//   ///posting login api request
//
//   Future<Response> postLoginRequest(String email, String password) async {
//     var response = await httpApiHelper.post(
//         BackendTextUtils.loginUrl, {"email": email, "password": password});
//     var jsonResponse = jsonDecode(response!.body);
//
//     dp(msg: "user token", arg: jsonResponse);
//
//     if (response.statusCode == 200 && jsonResponse["status"] == 200) {
//       await HiveLocalStorage.write(
//           boxName: LocalStorageTextUtils.currentRouteBox,
//           key: LocalStorageTextUtils.currentRouteKey,
//           value: SignInScreen.routeName);
//
//       await HiveLocalStorage.write(
//           boxName: LocalStorageTextUtils.userTokenBox,
//           key: LocalStorageTextUtils.userTokenKey,
//           value: jsonResponse["token"]);
//
//       showSuccessSnackBarMessage(content: "Login Successfully");
//       String userToken = await HiveLocalStorage.readHiveValue(
//         boxName: LocalStorageTextUtils.userTokenBox,
//         key: LocalStorageTextUtils.userTokenKey,
//       );
//       dp(msg: "hive user token", arg: userToken.toString());
//
//       await toRemoveAll(
//           context: navstate.currentState!.context,
//           widget: const BackgroundCheckView(
//               //index: 0,
//               ));
//
//       // toRemoveAll(
//       //     context: navstate.currentState!.context, widget: HomeScreen());
//     } else {
//       showErrorSnackBarMessage(content: "Invalid Email or Password");
//       dp(msg: "authentication json response", arg: jsonResponse.toString());
//       dp(msg: "response message", arg: jsonResponse["status"].toString());
//     }
//
//     return jsonResponse;
//   }
//
//   googleLogin() async {
//     final rawNonce = generateNonceUtils();
//
//     final nonce = sha256ofString(rawNonce);
//
//     final appleCredential = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//     );
//
//     final oauthCredential = OAuthProvider("apple.com").credential(
//       idToken: appleCredential.identityToken,
//       rawNonce: rawNonce,
//     );
//
//     var userCredential =
//         await FirebaseAuth.instance.signInWithCredential(oauthCredential);
//   }
// }
//
// String generateNonceUtils([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }
//
// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }
}
