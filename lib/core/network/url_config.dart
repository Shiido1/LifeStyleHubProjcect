enum Environment { development, staging, qa, production }

class UrlConfig {
  static const String login = 'login';
  static const String register = 'register';
  static const String otpVerification = 'verification-pin/confirm';
  static const String otpRequest = 'verification-pin/request';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';
  static const String setPassword = 'set-password';
  static const String changePassword = 'change-password';
  static const String retrievePassword = 'recover';
  static const String saveProfile = 'profile/save';
  static const String updateProfile = 'account/update';
  static const String profileList = '/profile/list';
  static const String profileDelete = '/profile/delete';
  static const String booking = 'booking/initiate';
  static const String bookingFlutterWave = 'booking/online/verify-payment';
  static const String bookingSendOfflineInstructions =
      'booking/offline/send-instructions';
  static const String bookingSendBioBank = 'booking/biobank/send-instructions';
  static const String fetchCollectionCenters = 'collection-centers/list';
  static const String fetchNationality = 'get-nationalities';
  static const String fetchState = 'get-country-states/Nigerian';
  static const String fetchLGA = 'get-state-lga/Lagos';
  static const String fetchSupportArea = 'collection-centers/list';
  static const String fetchCountries = 'get-countries';
  static const String csv = 'profile/upload';
  static const String articles = 'posts/list';
  static const String reservation = 'reservations/list';
  static const String results = 'results/list';
  static const String configs = 'booking-config';
  static const String verifyResults = 'results/verify?document_id=';
  static const String notifications = 'notifications/list';
  static const String banner = 'posts/list';
  static const String collaborate = '/contact-message/save';
  static const String resultStats = 'results/statistics';
  static const String verifyCompanyCode = 'organizations/info?code=';
  static const String requestCompany = 'organizations/request';
}
