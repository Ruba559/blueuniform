import 'package:get/get.dart';

validInput(String val, int min, int max, String type , bool? require ,  String? password ) {
  if (require == true && val.isEmpty) {
    return "cant_be_empty".tr;
  } 

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not_valid_email".tr;
    }
  }

   if (type == "confirmPassword") {
    if (val != password) {
      return "not_match".tr;
    }
  }


  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }



  if (require == true && val.length < min) {
    return "can't be less than $min";
  }

  if (require == true && val.length > max) {
    return "can't be larger than $max";
  }
}