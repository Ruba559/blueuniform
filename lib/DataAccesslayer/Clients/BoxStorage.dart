import 'package:get_storage/get_storage.dart';

import '../Models/user.dart';

class BoxStorage{
  final box = GetStorage();

  
  checkAuth()  {
    if ( box.read('blue_authed') != null) {
      return true;
    }
    return false;
  }

  Future<User> getUser() async {
    return User.fromJson(await box.read('blue_userdata'));
  }

 Future<User> getAuthedUser() async {
    print(await box.read('blue_userdata'));
    return User.fromMap(await box.read('blue_userdata'));
  }

    Future<bool> getAuthState() async {
    print(box.read('blue_authed'));
    if (await box.read('blue_authed') != null) {
      return true;
    }
    return false;
  }

 Future<void> setAuthedUser(User user) async {
    await box.write('blue_authed', true);
    await box.write('blue_userdata', user.toMap());
  }


  Future<void> removeUser() async {
    await box.remove('blue_authed');
    await box.remove('blue_userdata');
  }




  

}