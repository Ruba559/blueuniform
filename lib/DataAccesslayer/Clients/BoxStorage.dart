import 'package:get_storage/get_storage.dart';

import '../Models/user.dart';

class BoxStorage{
  final box = GetStorage();

  
  checkAuth()  {
    if ( box.read('authed') != null) {
      return true;
    }
    return false;
  }

  Future<User> getUser() async {
    return User.fromJson(await box.read('userdata'));
  }

  Future<void> setUser(User user) async {
    await box.write('authed', true);
    await box.write('userdata', user.toJson());
  }

  Future<void> removeUser() async {
    await box.remove('authed');
    await box.remove('userdata');
  }

  

}