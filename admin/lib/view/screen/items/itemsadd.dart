import 'package:admin/controller/items/addcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customdropdownsearch.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsadd extends StatelessWidget {
  const Itemsadd({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsAddcontroller controller = Get.put(ItemsAddcontroller());
    controller.colorsSelectedText.clear();

    return Scaffold(
      appBar: AppBar(title: Text("204".tr)),
      body: GetBuilder<ItemsAddcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Customtextformglobal(
                    hinttext: "205".tr,
                    labletext: "205".tr,
                    iconData: Icons.production_quantity_limits,
                    mycontroller: controller.name,
                    valid: (val) => validInput(val!, 1, 100, ""),
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "206".tr,
                    labletext: "206".tr,
                    iconData: Icons.production_quantity_limits,
                    mycontroller: controller.namear,
                    valid: (val) => validInput(val!, 1, 100, ""),
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "207".tr,
                    labletext: "207".tr,
                    iconData: Icons.description,
                    mycontroller: controller.desc,
                    valid: (val) => validInput(val!, 1, 500, ""),
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "208".tr,
                    labletext: "208".tr,
                    iconData: Icons.description,
                    mycontroller: controller.descar,
                    valid: (val) => validInput(val!, 1, 500, ""),
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "209".tr,
                    labletext: "209".tr,
                    iconData: Icons.countertops,
                    mycontroller: controller.count,
                    valid: (val) => validInput(val!, 1, 10, ""),
                    isnumber: true,
                  ),
                  Customtextformglobal(
                    hinttext: "210".tr,
                    labletext: "210".tr,
                    iconData: Icons.countertops,
                    mycontroller: controller.discount,
                    valid: (val) => validInput(val!, 1, 3, ""),
                    isnumber: true,
                  ),
                  Customtextformglobal(
                    hinttext: "211".tr,
                    labletext: "211".tr,
                    iconData: Icons.price_change_outlined,
                    mycontroller: controller.price,
                    valid: (val) => validInput(val!, 1, 10, ""),
                    isnumber: true,
                  ),
                  TextFormField(
                    controller: controller.colorsSelectedText,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "274".tr,
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onTap: () {
                      for (var item in controller.colorsList) {
                        item.isSelected = false;
                      }
                      DropDownState(
                        dropDown: DropDown(
                          bottomSheetTitle: Text(
                            "274".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          data: controller.colorsList,
                          enableMultipleSelection: true,
                          submitButtonText: "275".tr,
                          clearButtonText: "276".tr,
                          onSelected: (List<dynamic> selectedItems) {
                            final selectedColors = selectedItems
                                .map((item) => (item as SelectedListItem).value)
                                .join(", ");
                            controller.colorsSelectedText.text = selectedColors;
                            controller.update();
                          },
                        ),
                      ).showModal(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "277".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Customdropdownsearch(
                    title: "212".tr,
                    listdata: controller.dropdownlist,
                    dropdownselectedname: controller.catname!,
                    dropdownselectedid: controller.catid!,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      onPressed: controller.showoptionImage,
                      child: Text(
                        "213".tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (controller.file != null)
                    SizedBox(
                      height: 70,
                      child: Image.file(controller.file!),
                    ),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "196".tr,
                    onPressed: controller.addData,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
