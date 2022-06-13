import 'package:code95/components/CustomTextFormField.dart';
import 'package:code95/components/DropDownMenu.dart';
import 'package:code95/components/TextWidget.dart';
import 'package:code95/helpers/Extensions.dart';
import 'package:code95/pages/filterPage/viewModel/FilterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class QueryBuilderView extends StatefulWidget {
  const QueryBuilderView({Key? key}) : super(key: key);

  @override
  State<QueryBuilderView> createState() => _QueryBuilderViewState();
}

class _QueryBuilderViewState extends State<QueryBuilderView> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterViewModel>(
        init: FilterViewModel(),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              //had to change to make the container color visible
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 6,
                              child: TextWidget(
                                title: "Query Builder",
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.showMore = true;
                                    controller.update();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: HexColor.fromHex("#219653"),
                                          width: 1,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.add,
                                          color: HexColor.fromHex("#219653"),
                                        ),
                                      )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                              color: HexColor.fromHex("#F7F7F7"),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: DropDownMenu(
                                      dropDownValue: controller.dropdownValue,
                                      list: controller.list,
                                      onChanged: (value){
                                        controller.dropdownValue = value ?? "";
                                        controller.update();
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: DropDownMenu(
                                      dropDownValue: controller.dropdownEqualNAme,
                                      list: controller.equalList,
                                      onChanged: (value){
                                        controller.dropdownEqualNAme = value ?? "";
                                        controller.update();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              CustomTextField(
                                isEnabled: true,
                                hint: controller.dropdownValue,
                                onChanged: (value) {
                                    if (value!.isEmpty ) {
                                      controller.firstTextFieldValidated = true;
                                    } else {
                                      controller.firstTextFieldValidated = false;
                                    }
                                    controller.update();
                                },
                                onSaved: (value) {
                                  controller.firstValue = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty ) {
                                    return "You must enter some text";
                                  } else {
                                    return null;
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            width: 80,
                            child: DropDownMenu(
                              dropDownValue: controller.dropdownAndOr,
                              list: controller.andOrList,
                              onChanged: (value){
                                controller.dropdownAndOr = value ?? "";
                                controller.update();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.showMore
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: HexColor.fromHex("#F7F7F7"),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: DropDownMenu(
                                                  dropDownValue: controller.dropdownGender,
                                                  list: controller.genderList,
                                                  onChanged: (value){
                                                    controller.dropdownGender = value ?? "";
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: DropDownMenu(
                                                  dropDownValue: controller.dropdownEqualGender,
                                                  list: controller.equalListGender,
                                                  onChanged: (value){
                                                    controller.dropdownEqualGender = value ?? "";
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          CustomTextField(
                                            isEnabled: false,
                                            hint: controller.dropdownGender,
                                            onTap: () {},
                                            onChanged: (value) {

                                            },
                                            onSaved: (value) {
                                            },
                                            validator: (value) {
                                              return null;
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.showMore = false;
                                          controller.update();
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: HexColor.fromHex("#EB5757"),
                                                width: 1,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Icon(
                                                Icons.clear,
                                                color: HexColor.fromHex("#EB5757"),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ))
                            : const SizedBox(),
                        SizedBox(
                          height: controller.showMore ? 25 : 0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .07,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                                backgroundColor: HexColor.fromHex("#2D9CDB"),
                                padding: const EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                controller.validateData();
                              },
                              child: const Icon(
                                Icons.search_sharp,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
