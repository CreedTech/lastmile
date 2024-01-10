class AppConstants {
  static const BASE_URL = 'https://taaconnectportal.com';
  // ======================= AUTH ENDPOINTS ======================= //
  static const SIGN_UP = '/api/user/create';
  static const LOGIN = '/auth/login/';
  static const GET_USER = '/api/user/get-user';
  static const OTP = '/auth/password-reset/validate-token/';
  static const RESENDOTP = '/api/user/resend-verification-otp';
  static const FORGOTPASSWORD = '/auth/password-reset/';
  static const RESEND_PASSWORD_OTP = '/api/user/resend-password-otp';

  static const RESET_PASSWORD = '/auth/password-reset/confirm/';

  static const VERIFY_CODE = '/api/auth/verify';

  static const TOKEN = '';
  static const PROFILE_PICTURE = '';

  // ======================= ORDERS ENDPOINTS ======================= //
  static const RECENT_ORDER = '/order/recent-order/';
  static const FILTER_ORDERS = '/order/filter/';
  static const FETCH_SINGLE_ORDER = '/order/recent-order/';

  // ======================= TERMINALS ENDPOINTS ======================= //
  static const GET_TERMINALS = '/last-mile-admin/terminal/info/';
}
