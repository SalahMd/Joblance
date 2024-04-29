class AppLinks {
  static String IP = "http://192.168.1.105:8000";
  static String logIn = "$IP" "/api/login";
  static String signUp = "$IP" "/api/register";
  static String logOut = "$IP" "/api/user/logout";
  static String googleSignin = "$IP" "/api/auth/google/login";
  static String emailVerificationForPassword = "$IP" "/api/user/password/email";
  static String resendCodeForPassword = "$IP" "/api/user/password/email/resend";
  static String resendCodeSignup = "$IP" "/api/user/email/code/resend";
  static String checkCodeForPassword = "$IP" "/api/user/password/code/check";
  static String checkCodeForSignUp = "$IP" "/api/user/email/code/check";
  static String resetPassword = "$IP" "/api/user/password/reset";
  static String category = "$IP" "/api/category";
  static String applayJob = "$IP" "/api/applayjob";
  static String ChangePassword = "$IP" "/api/user/changepassword";
  static String profile = "$IP" "/api/profile/";
  static String freelancers = "$IP" "/api/freelancers/";
  static String jobs = "$IP" "/api/jobs";
  static String user = "$IP" "/api/user";
  static String googleSignup = "$IP" "/api/auth/google/userinfo";
  static String getMessages = "$IP" "/api/conversations/";
  static String sendMessage = "$IP" "/api/message/send";
  static String getConversations = "$IP" "/api/conversations";
  static String readMessages = "$IP" "/api/conversations";
  static String deleteMessage = "$IP" "/api/message/";
}
