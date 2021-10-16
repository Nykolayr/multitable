import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  String _userName = '';
  String _firstName = '';
  String _lastName = '';
  String _photoUrl = '';
  String _email = '';
  String _source = 'api';
  String _country = 'England';
  String _token = '';
  bool _hasUser = false;
  bool _hasVerified = true;
  bool _has2FA = true;

  UserRepository._();
  static Future<UserRepository> create() async {
    UserRepository userRepository = UserRepository._();
    await userRepository.loadUser();
    return userRepository;
  }

  Future<void> saveDataApi(source, user) async {
    userName = user['name'];
    firstName = user['firstName'];
    lastName = user['lastName'];
    email = user['email'];
    photoUrl = user['PhotoUrl'];
    source = source;
    _hasUser = true;
    await saveUser();
  }

  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _userName);
    await prefs.setString('firstName', _firstName);
    await prefs.setString('lastName', _lastName);
    await prefs.setString('photoUrl', _photoUrl);
    await prefs.setString('email', _email);
    await prefs.setString('source', _source);
    await prefs.setString('country', _country);
    await prefs.setString('token', _token);
    await prefs.setBool('hasUser', _hasUser);
    await prefs.setBool('hasVerified', _hasVerified);
    await prefs.setBool('has2FA', _has2FA);
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> setKeys = prefs.getKeys();
    if (setKeys.contains('username')) {
      _userName = prefs.getString('username')!;
      _firstName = prefs.getString('firstName')!;
      _lastName = prefs.getString('lastName')!;
      _photoUrl = prefs.getString('photoUrl')!;
      _email = prefs.getString('email')!;
      _source = prefs.getString('source')!;
      _country = prefs.getString('country')!;
      _token = prefs.getString('token')!;
      _hasUser = prefs.getBool('hasUser')!;
      _hasVerified = prefs.getBool('hasVerified')!;
      _has2FA = prefs.getBool('has2FA')!;
    } else {
      saveUser();
    }
  }

  String get token => _token;
  set token(val) {
    _token = val;
  }

  String get country => _country;
  set country(val) {
    _country = val;
  }

  bool get has2FA => _has2FA;
  set has2FA(val) {
    _has2FA = val;
  }

  String get source => _source;
  set source(val) {
    _source = val;
  }

  bool get hasVerified => _hasVerified;
  set hasVerified(val) {
    _hasVerified = val;
  }

  String get email => _email;
  set email(val) {
    _email = val;
  }

  String get userName => _userName;
  set userName(val) {
    _userName = val;
  }

  String get firstName => _firstName;
  set firstName(val) {
    _firstName = val;
  }

  String get lastName => _lastName;
  set lastName(val) {
    _lastName = val;
  }

  String get photoUrl => _photoUrl;
  set photoUrl(val) {
    _photoUrl = val;
  }

  bool get hasUser => _hasUser;
  set hasUser(val) {
    _hasUser = val;
  }
}
