import 'package:get_storage/get_storage.dart';

import '../Models/user.dart';

class BoxStorage {
  final box = GetStorage();

  checkAuth() {
    if (box.read('authed_blue') != null) {
      return true;
    }
    return false;
  }

  Future<User> getUser() async {
    return User.fromJson(await box.read('userdata_blue'));
  }

  Future<User> getAuthedUser() async {
    print(await box.read('userdata_blue'));
    return User.fromMap(await box.read('userdata_blue'));
  }

  Future<bool> getAuthState() async {
    print(box.read('authed_blue'));
    if (await box.read('authed_blue') != null) {
      return true;
    }
    return false;
  }

  Future<void> setAuthedUser(User user) async {
    await box.write('authed_blue', true);
    await box.write('userdata_blue', user.toMap());
  }

  Future<void> removeUser() async {
    await box.remove('authed_blue');
    await box.remove('userdata_blue');
  }
}
