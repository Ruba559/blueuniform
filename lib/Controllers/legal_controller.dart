import 'package:get/get.dart';

import '../DataAccesslayer/Clients/legals_client.dart';

class LegalController extends GetxController {
  LegalsCleint cleint = LegalsCleint();

  String privacy = "";

  String terms = "";
  String about = "";

  @override
  void onInit() async {
    privacy = await cleint.getPrivacy();
    terms = await cleint.getTerms();
    about = await cleint.getAbout();

    super.onInit();
  }
}
