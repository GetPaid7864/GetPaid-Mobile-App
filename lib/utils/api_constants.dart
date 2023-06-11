class Apis {
  static const String baseUrl = 'http://52.60.46.195/dev/api/v1/';

  ///Recruiter Side
  static const String register = '/recruiter';

  //static const String forgotPassword = '/forgot_pass';
  // static const String confirmCode = '/confirm_code';
  static const String login = 'login/recruiter';
  static const String verifyPhoneOtp = 'recruiter';
  static const String resendOTP = 'resend-otp';

  static const String getDashBoardData = 'jobs/recruiter/';

  ///jobs section
  static const String createJob = 'jobs';
  static const String getAllRecruiterJobs = 'jobs';
  static const String getRecruiterJobDetails = 'jobs/';

  static const String deleteRecruiterJob = 'jobs/';

  ///profile section
  static const String getRecruiterProfile = 'recruiter/';

  ///proposal Section
  static const String getRecruiterJobProposals = 'recruiter/proposal/';
}
