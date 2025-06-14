class ApiPaths {
  static const String base = 'http://209.38.155.136:8001/api';


  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String logout = '$auth/logout';
  static const String register = '$auth/register';
  static String update(int id) => '$auth/update/$id/';
  static String deleteAccount(int id) => '$auth/delete/$id/';
}
