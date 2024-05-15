// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names
class WebApis {
 // static String SERVER_URL = "http://164.52.192.76:8080/kalaam/";
  static String SERVER_URL = "https://eshop.kalaam-telecom.com/";
  //static String SERVER_URL  =  "https://kalaam.conferhub.com/kalaam-ci/";

  static String AUTH_TOKEN = SERVER_URL + "api/auth/authToken";
  static String VERIFY_TOKEN = SERVER_URL + "api/auth/verifyToken";
  static String CATEGORY = SERVER_URL + "api/dashboard/category";
  static String SUB_CATEGORY = SERVER_URL + "api/dashboard/sub_category";
  static String BANNER = SERVER_URL + "api/dashboard/banner";
  static String PRODUCT = SERVER_URL + "api/dashboard/product";
  static String SIGN_UP = SERVER_URL + "api/auth/signup";
  static String ACCOUNT_DELETE = SERVER_URL + "api/dashboard/accountdelete";
  static String ACCOUNT_RESTORE = SERVER_URL + "api/auth/restoreaccount";
  static String ACCOUNT_RESTORE_OTP = SERVER_URL + "api/auth/send_restore_otp";
  static String VERIFY_OTP = SERVER_URL + "api/auth/verifyotp";
  //static String ENCRYPT_DATA  = SERVER_URL +  "api/auth/commonForEnc";
  //static String DECRYPT_DATA  = SERVER_URL +  "api/auth/commonForDesc";
  static String OUTSTANDING = SERVER_URL + "api/dashboard/outstanding";
  static String RESEND_OTP = SERVER_URL + "api/auth/resendotp";
  static String FORGET_PASSWORD = SERVER_URL + "api/auth/forgetpassword";
  static String UPDATE_PASSWORD = SERVER_URL + "api/auth/updatepassword";
  static String SURVEY = SERVER_URL + "api/survey";
  static String OFFERS = SERVER_URL + "api/offers";
  static String LOGIN = SERVER_URL + "api/auth/login";
  static String CHANGE_PASSWORD = SERVER_URL + "api/dashboard/changepassword";
  static String ABOUT_US = SERVER_URL + "api/dashboard/aboutus";
  static String JOIN_AS_A_PARTNER = SERVER_URL + "api/partner";
  static String CASE_STUDIES_LIST = SERVER_URL + "api/casestudies";
  static String CASE_STUDIES_DETAILS = SERVER_URL + "api/casestudies/details";
  static String NEWS_BANNER = SERVER_URL + "api/news/banner";
  static String NEWS_LIST = SERVER_URL + "api/news";
  static String FAQ = SERVER_URL + "api/dashboard/faq";
  static String ADD_TO_CART = SERVER_URL + "api/cart/addtocart";
  static String ADD_TO_CART_V1 = SERVER_URL + "api/cart/addtocart_v1";
  static String UPDATE_CART = SERVER_URL + "api/cart/updatetocart";
  static String CART_LIST = SERVER_URL + "api/cart";
  static String ORDER_LIST = SERVER_URL + "api/order";
  static String TICKET_LIST = SERVER_URL + "api/ticket";
  static String TICKET_MSG_ALL = SERVER_URL + "api/ticket/view";
  static String TICKET_MSG_SEND = SERVER_URL + "api/ticket/reply";
  static String NOTIFICATION_LIST = SERVER_URL + "api/notifications";
  static String ORDER_PROCEED = SERVER_URL + "api/order/proceed";
  static String ORDER_PROCEED_V1 = SERVER_URL + "api/order/proceed_v1";
  static String CART_DELETE = SERVER_URL + "api/cart/deleteproduct";
  static String PROFILE_IMAGE = SERVER_URL + "api/dashboard/profile_image";
  static String CONTACT_US = SERVER_URL + "api/dashboard/setting";
  static String CUSTOMER = SERVER_URL + "api/kalaam/index_v1";

  static String COUNTRY_CODE = SERVER_URL + "api/auth/countrycode";
  static String TICKET_SERVICES = SERVER_URL + "api/ticket/service";
  static String TICKET_ISSUE = SERVER_URL + "api/ticket/ticketissue_V1";

  static String TICKET_CREATE = SERVER_URL + "api/ticket/create";
  static String TICKET_STATUS = SERVER_URL + "api/ticket/ticketstatus";
  static String WHATSAPP = SERVER_URL + "api/ticket/whatsappcounter";
  static String DASHBOARD = SERVER_URL + "api/dashboard/index_v1";
  static String GET_SURVEY_BY_STATUS =
      SERVER_URL + "api/survey/getsurveybystatus";
  static String SURVEY_TRIGGER = SERVER_URL + "api/dashboard/surveytrigger";
  static String UPDATE_PROFILE = SERVER_URL + "api/dashboard/updateprofile";
  static String UPDATE_PROFILE_V1 =
      SERVER_URL + "api/dashboard/updateprofile_v1";
  static String UPDATE_DEVICE_TOKEN = SERVER_URL + "api/auth/firebaseupdate";

  static String PAYMENT_BOX = SERVER_URL + "api/kalaam/paymentOption";
  static String PAYMENT_URL = SERVER_URL + "api/kalaam/paymentUrl";
  static String PAYMENT_URL_V1 = SERVER_URL + "api/kalaam/paymentUrl_v1";

  static String PAYMENT_URL_V2 = SERVER_URL + "api/kalaam/paymentUrl_v2";

  static String GET_REQUEST = SERVER_URL + "api/order/allrequest";
  static String GET_REQUEST_DATA = SERVER_URL + "api/order/viewrequest";

  static String APP_SESSION = SERVER_URL + "api/dashboard/appsession";
}
