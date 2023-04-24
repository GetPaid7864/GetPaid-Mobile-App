class BackendTextUtils {
  static const String apiBaseUrl =
      "http://ec2-3-95-223-15.compute-1.amazonaws.com/api/v1";

  static String accessTokenUrl = "$apiBaseUrl/access/token";

  static String loginUrl = "$apiBaseUrl/login";
  static String signupUrl = "$apiBaseUrl/users";
}
