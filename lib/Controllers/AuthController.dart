import 'package:blueuniform/Controllers/userController.dart';
import 'package:blueuniform/DataAccesslayer/Models/semester.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/routes.dart';
import '../DataAccesslayer/Clients/BoxStorage.dart';
import '../DataAccesslayer/Models/branch.dart';
import '../DataAccesslayer/Models/city.dart';
import '../DataAccesslayer/Models/classe.dart';
import '../DataAccesslayer/Models/school.dart';
import '../DataAccesslayer/Models/section.dart';
import '../DataAccesslayer/Models/stage.dart';
import '../DataAccesslayer/Models/user.dart';
import '../DataAccesslayer/Repository/RegisterRepo.dart';
import '../main.dart';

class AuthController extends GetxController {
  late TextEditingController studentName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> formstateinfo = GlobalKey<FormState>();
  BoxStorage boxStorage = BoxStorage();

  RegisterRepo registerRepo = RegisterRepo();

  List<School> schools = [];
  List<City> cities = [];
  List<Classe> classes = [];
  List<Branch> branches = [];
  List<Section> sections = [];
  List<Stage> stages = [];
  List<Semester> semesters = [];

  late School school;
  late City city;
  late Classe classe;
  late Branch branch;
  late Section section;
  late Stage stage;
  late Semester semester;

 final UserController userController = Get.find();
  late User user;

  var isLoading = false.obs;

  Future<void> onInit() async {
    await getData();
    update();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;
    schools = await registerRepo.getSchools();
    school = schools.first;
    cities = await registerRepo.getCities();
    city = cities.first;
    classes = await registerRepo.getClasses();
    classe = classes.first;
    branches = await registerRepo.getBranches();
    branch = branches.first;
    sections = await registerRepo.getSections();
    section = sections.first;
    stages = await registerRepo.getStages();
    stage = stages.first;
    semesters = await registerRepo.getSemesters();
    semester = semesters.first;
    isLoading.value = false;
  }

  getRegister() {
    Get.toNamed(AppRoute.register);
  }

  selectSchool(value) {
    school = value;
    update();
  }

  selectCity(value) {
    city = value;
    update();
  }

  selectClasse(value) {
    classe = value;
    update();
  }

  selectBranch(value) {
    branch = value;
    update();
  }

  selectSection(value) {
    section = value;
    update();
  }

  selectStage(value) {
    stage = value;
    update();
  }

  selectSemester(value) {
    semester = value;
    update();
  }

  getLoginInfo() {
    Get.toNamed(AppRoute.loginInfo);
  }

  register() async {
    if (formstateinfo.currentState!.validate()) {
       isLoading.value = true;
    user = await registerRepo.register(
          email.text,
          password.text,
          studentName.text,
          school.id.toString(),
          city.id.toString(),
          section.id.toString(),
          classe.id.toString(),
          stage.id.toString(),
          semester.id.toString(),
          branch.id.toString());

   MyApp.user = user;
        await userController.saveAuthState(user);


        isLoading.value = false;
         Get.offAllNamed(AppRoute.home);
    }
  }

  
}
