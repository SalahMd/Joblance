class AppLinks {
  static String IP = "http://192.168.1.105:8000";
  static String logIn = "$IP" "/api/login";
  static String signUp = "$IP" "/api/register";
  static String logOut = "$IP" "/api/logout";
  static String googleSignin = "$IP" "/api/google/redirect";
  static String emailVerification = "$IP" "/api/user/password/email";
  static String resendCode = "$IP" "/api/user/password/email/resend";
  static String checkCode = "$IP" "/api/user/password/code/check";
  static String resetPassword = "$IP" "/api/user/password/reset";
  static String category = "$IP" "/api/category";
  static String applayJob = "$IP" "/api/applayjob";
  static String jobs = "$IP" "/api/jobs";
  static String user = "$IP" "/api/user";
}
