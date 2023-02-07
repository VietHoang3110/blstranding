 // ignore: camel_case_types
class BASE_URL {
  BASE_URL._();

  static const GET_INFO_USER = 'api/user/profile';
  static const LOGIN = 'api/auth';
  static const HOME = 'api/home';
  static const HOME_INV = 'api/investment_contract';
  static const HOME_OWN = 'api/home_own';
  static const CONTRACT_INV = 'api/settlement_contract_inventor';
  static const TRANS = 'api/transaction';
  static const TRANS_OWN = 'api/trans_own';
  static const MONEY = 'api/money_transaction';
  static const MONEY_OWN = 'api/money_own';

  // static const UNREALIZED = 'api/unrealized';
  static const UNREALIZED = 'api/provisional';

  // static const UNREALIZED_OWN = 'api/unrealized_own';
  static const UNREALIZED_OWN = 'api/provisional_list_own';

  // static const Sumunrealized = 'api/sumunrealized';
  static const Sumunrealized = 'api/nav';

  // static const Sumunrealized_OWN = 'api/sumunrealized_own';
  static const Sumunrealized_OWN = 'api/provisional_summation_own';

  // static const Realized = 'api/realized';
  static const Realized = 'api/settlement';

  // static const Realized_OWN = 'api/realized_own';
  static const Realized_OWN = 'api/finalization';

  // static const Sumrealized = 'api/sumrealized';
  static const Sumrealized = 'api/sumunrealized';


  static const Sumrealized_OWN = 'api/sumunrealized_own';
  static const profile_own = 'api/profile_own';
  static const profile_inv = 'api/profile_inv';
  static const profile = 'api/profile';
  static const CONTACT = 'api/contact';
  static const PROVISO = 'api/proviso';
  static const INFO = 'api/info';
  static const NOTI = 'api/notification';


  static const REGISTER = 'api/user/register-user';
  static const PROFILE = 'api/user/profile';
  static const EDIT_PROFILE = 'api/change_information';
  static const READ_NOTI = 'api/change_notification';
  static const CHANGE_PASSWORD = 'api/change_password';
  static const FORGOT_PASSWORD = 'api/user/forgot-password';
  static const OTP_RESET_PASSWORD = 'api/user/vertify-otp';
  static const RESET_PASSWORD = 'api/user/new-password';
  static const FIRST_INTRODUCE = 'api/user/introductions';
  static const INTRODUCE = 'api/user/introductions2';
  static const GET_LOGO = 'api/user/config-logo';
  static const GET_LIST_NEW = 'api/user/news';
  static const GET_LIST_DOCUMENTS = 'api/user/documentations';
  static const GET_LIST_COURSE = 'api/user/list-course';
  static const DETAIL_COURSE = 'api/user/detail-course';
  static const ORDER_COURSE = 'api/user/order';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  static const ENV  = 'assets/.env';

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const int SUCCESS_200 = 200;

  static const content_type = 'Content-Type';
  static const application_json = 'application/json';
  ////////////////////////////////////////////////////////
  static const multipart_form_data = 'multipart/form-data';

  static const auth_type = 'Token';
  ////////////////////////////////////////////////////////
  static String bearer(String token) => token;

  static const headerDemoKey = 'Demo-Header';
  static const headerDemoValue = 'demo header';

  static const SUCCESS = 0;
  static const FAIL = 9100;

  static const ACTIVE = 1;
  static const LOCK = 0;
}
