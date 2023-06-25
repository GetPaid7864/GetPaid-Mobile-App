class Apis {
  static const String baseUrl = 'http://52.60.46.195/dev/api/v1/';

  static const String imageBaseUrl = 'http://52.60.46.195/dev/';

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
  static const String getRecruiterJobProposals = '/jobs/proposal/';

  static const String updateProposalToApproved = 'proposals';

  ///contracts section-----------------------------------------------------------------
  static const String getRecruiterContracts = 'contracts/recruiter/';
  static const String getRecruiterContractDetails = 'contracts/';

  //http://52.60.46.195/dev/api/v1/proposals

//  static const String getRecruiterJobProposals = 'recruiter/proposal/';
  // jobs/proposal

  ///-------------------------JobSeeker EndPoints Section-----------------------------

  static const String jobSeekerLoginEndPoint = 'login/job-seeker';
  static const String registerJobSeeker = 'job-seeker';
  static const String verifyOTPNew = 'verify-otp';

  static const String jobSeekerDashboardDataEndPoint = 'jobs/dashboard/';

  static const String getProposalsOfJobSeeker = 'proposal/';
  static const String createProposal = 'proposals';
  static const String getJobSeekerProfile = 'job-seeker/';
  static const String updateJobSeeker = 'job-seeker';
}
