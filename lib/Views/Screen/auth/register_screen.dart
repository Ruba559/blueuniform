import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/AuthController.dart';
import '../../../DataAccesslayer/Models/branch.dart';
import '../../../DataAccesslayer/Models/city.dart';
import '../../../DataAccesslayer/Models/classe.dart';
import '../../../DataAccesslayer/Models/school.dart';
import '../../../DataAccesslayer/Models/section.dart';
import '../../../DataAccesslayer/Models/semester.dart';
import '../../../DataAccesslayer/Models/stage.dart';
import '../../../Functions/valid_input.dart';
import '../../Widgets/button_form.dart';
import '../../Widgets/input_form.dart';
import '../../Widgets/label_form.dart';
import '../../Widgets/list_title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: GetBuilder<AuthController>(
              builder: (controller) => SingleChildScrollView(
                      child: Form(
                    key: controller.formstate,
                    child: Column(children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 70,
                        //   fit: BoxFit.fill,
                      ),
                      const AppListTitle(text: 'إنشاء حساب', textAlign: 'center',),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: LabelForm(
                          text: "اسم المدرسة",
                        ),
                      ),

                      InputDecorator(
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: radius10,
                            borderSide: BorderSide(
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<School>(
                              value: controller.school,
                            isDense: true,
                            isExpanded: true,
                            items: controller.schools
                                .map((School item) => DropdownMenuItem<School>(
                                    value: item,
                                    child: Text(item.name)))
                                .toList(),
                            onChanged: (School? value) {
                                 controller.selectSchool(value);
                            },
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.bottomRight,
                                    child: LabelForm(
                                      text: "الفرع/ الحي",
                                    )),
                                InputDecorator(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: radius10,
                                      borderSide: BorderSide(
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<Branch>(
                                        value: controller.branch ,
                                      isDense: true,
                                      isExpanded: true,
                                      items: controller.branches
                                          .map((Branch item) =>
                                              DropdownMenuItem<Branch>(
                                                  value: item,
                                                  child: Text(item.name)))
                                          .toList(),
                                      onChanged: (Branch? value) {
                                           controller.selectBranch(value);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.bottomRight,
                                  child: LabelForm(
                                    text: "المدينة",
                                  )),
                              InputDecorator(
                                decoration: const InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: radius10,
                                    borderSide: BorderSide(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<City>(
                                      value: controller.city,
                                    isDense: true,
                                    isExpanded: true,
                                    items: controller.cities
                                        .map((City item) =>
                                            DropdownMenuItem<City>(
                                                value: item,
                                                child: Text(item.name)))
                                        .toList(),
                                    onChanged: (City? value) {
                                         controller.selectCity(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      InputForm(
                        label: 'اسم الطالب',
                        valid: (val) {
                          return validInput(val!, 2, 50, "email", true, null);
                        },
                         mycontroller: controller.studentName,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.bottomRight,
                                    child: LabelForm(
                                      text: "المرحلة",
                                    )),
                                InputDecorator(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: radius10,
                                      borderSide: BorderSide(
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<Stage>(
                                        value: controller.stage,
                                      isDense: true,
                                      isExpanded: true,
                                      items: controller.stages
                                          .map((Stage item) =>
                                              DropdownMenuItem<Stage>(
                                                  value: item,
                                                  child: Text(item.name)))
                                          .toList(),
                                      onChanged: (Stage? value) {
                                           controller.selectStage(value);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.bottomRight,
                                  child: LabelForm(
                                    text: "القسم",
                                  )),
                              InputDecorator(
                                decoration: const InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: radius10,
                                    borderSide: BorderSide(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Section>(
                                      value: controller.section,
                                    isDense: true,
                                    isExpanded: true,
                                    items: controller.sections
                                        .map((Section item) =>
                                            DropdownMenuItem<Section>(
                                                value: item,
                                                child: Text(item.name)))
                                        .toList(),
                                    onChanged: (Section? value) {
                                         controller.selectSection(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.bottomRight,
                                    child: LabelForm(
                                      text: "الصف",
                                    )),
                                InputDecorator(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: radius10,
                                      borderSide: BorderSide(
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<Classe>(
                                        value: controller.classe,
                                      isDense: true,
                                      isExpanded: true,
                                      items: controller.classes
                                          .map((Classe item) =>
                                              DropdownMenuItem<Classe>(
                                                  value: item,
                                                  child: Text(item.name)))
                                          .toList(),
                                      onChanged: (Classe? value) {
                                           controller.selectClasse(value);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.bottomRight,
                                  child: LabelForm(
                                    text: "الفصل",
                                  )),
                              InputDecorator(
                                decoration: const InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: radius10,
                                    borderSide: BorderSide(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Semester>(
                                      value: controller.semester,
                                    isDense: true,
                                    isExpanded: true,
                                    items: controller.semesters
                                        .map((Semester item) =>
                                            DropdownMenuItem<Semester>(
                                                value: item,
                                                child: Text(item.name)))
                                        .toList(),
                                    onChanged: (Semester? value) {
                                      controller.selectSemester(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      // Obx(() {
                      //   return
                      ButtonForm(
                        text: "التالي",
                        color: AppColors.secondary,
                        onPressed: () async {
                          controller.getLoginInfo();
                        },
                         //isLoading: controller.logging.value
                      )
                      // }),
                    ]),
                  ))),
        )));
  }
}
