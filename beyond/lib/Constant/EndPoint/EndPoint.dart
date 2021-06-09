class EndPoint {
  //PROD

  static String accessKey = "wts5nKRGF7S2DV7zWCA5hjWnBAJ7M3v7";
  static String placeKeyAndroid = "AIzaSyCVBsAU2iGazyDvkjdUpuhAjQ6GXIy7H7E";
  static String placeKeyIos = "AIzaSyCVBsAU2iGazyDvkjdUpuhAjQ6GXIy7H7E";
  //DEV
  static String baseUrl = 'api-dev.tutos.pro';

  static String login = '/api/user/connect';
  static String checkEmail = '/api/user/emailexists';
  static String signUp = '/api/user/one';
  static String userInfo = '/api/user/one';
  static String offres = "/api/job/online";
  static String individuel = "/api/training/individual/list";
  static String collective = "/api/training/collective/list";
  static String invoice = "/api/trainer/invoices";
  static String applyJob = "/api/job/apply";
  static String forgotPassword = "/api/user/lostpassword";
  static String skills = "/api/core/skills/list";
  static String skillsAdd = "/api/trainer/skill";
  static String settings = "/api/core/settings";
  static String purchaseOrder = "/api/trainer/bdc/list";
  static String contactUs = "api/core/contact-us";
  static String editInfoUser = "/api/user/one";
  static String uploadImage = "/api/user/update-avatar";
  static String getMission = "/api/training/trainer/all";
  static String getYouSign = "/api/training/trainer/sign";
  static String missionAnswer = "/api/training/proposed/trainer/answer";
  static String pushDevice = "/api/push/device";
  static String getValidationHours = "/api/training_product/many";
  static String getValidationHoursForm = "/api/training_product/one";
  static String validateHours = "/api/training_product/trainer/hours";
}
