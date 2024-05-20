class AppLinks {
  static String IP = "http://192.168.1.105:8000";
  
  static String get logIn => "$IP/api/login";
  static String get signUp => "$IP/api/register";
  static String get logOut => "$IP/api/user/logout";
  static String get googleSignin => "$IP/api/auth/google/login";
  static String get emailVerificationForPassword => "$IP/api/user/password/email";
  static String get resendCodeForPassword => "$IP/api/user/password/email/resend";
  static String get resendCodeSignup => "$IP/api/user/email/code/resend";
  static String get checkCodeForPassword => "$IP/api/user/password/code/check";
  static String get checkCodeForSignUp => "$IP/api/user/email/code/check";
  static String get resetPassword => "$IP/api/user/password/reset";
  static String get major => "$IP/api/major";
  static String get applayJob => "$IP/api/applayjob";
  static String get jobInfo => "$IP/api/job";
  static String get changePassword => "$IP/api/user/changepassword";
  static String get profile => "$IP/api/user/";
  static String get freelancers => "$IP/api/freelancer";
  static String get jobs => "$IP/api/jobs";
  static String get sendReport => "$IP/api/report/send";
  static String get user => "$IP/api/user";
  static String get googleSignup => "$IP/api/auth/google/userinfo";
  static String get getMessages => "$IP/api/conversations/";
  static String get sendMessage => "$IP/api/message/send";
  static String get getConversations => "$IP/api/conversations";
  static String get readMessages => "$IP/api/conversations";
  static String get deleteMessage => "$IP/api/message/";
  static String get skills => "$IP/api/user_skills";
  static String get project => "$IP/api/userProject";
}
