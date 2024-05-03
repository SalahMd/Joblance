class AppLinks {
  static const String IP = "http://192.168.1.105:8000";
  static const String logIn = "$IP" "/api/login";
  static const String signUp = "$IP" "/api/register";
  static const String logOut = "$IP" "/api/user/logout";
  static const String googleSignin = "$IP" "/api/auth/google/login";
  static const String emailVerificationForPassword =
      "$IP" "/api/user/password/email";
  static const String resendCodeForPassword =
      "$IP" "/api/user/password/email/resend";
  static const String resendCodeSignup = "$IP" "/api/user/email/code/resend";
  static const String checkCodeForPassword =
      "$IP" "/api/user/password/code/check";
  static const String checkCodeForSignUp = "$IP" "/api/user/email/code/check";
  static const String resetPassword = "$IP" "/api/user/password/reset";
  static const String major = "$IP" "/api/major";
  static const String applayJob = "$IP" "/api/applayjob";
  static const String jobInfo = "$IP" "/api/job";
  static const String ChangePassword = "$IP" "/api/user/changepassword";
  static const String profile = "$IP" "/api/user/";
  static const String freelancers = "$IP" "/api/freelancer";
  static const String jobs = "$IP" "/api/jobs";
  static const String sendReport = "$IP" "/api/report/send";
  static const String user = "$IP" "/api/user";
  static const String googleSignup = "$IP" "/api/auth/google/userinfo";
  static const String getMessages = "$IP" "/api/conversations/";
  static const String sendMessage = "$IP" "/api/message/send";
  static const String getConversations = "$IP" "/api/conversations";
  static const String readMessages = "$IP" "/api/conversations";
  static const String deleteMessage = "$IP" "/api/message/";
  static const String skills = "$IP" "/api/skills";
}
