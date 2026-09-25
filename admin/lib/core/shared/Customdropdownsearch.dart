import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customdropdownsearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownselectedname;
  final TextEditingController dropdownselectedid;

  const Customdropdownsearch({
    super.key,
    this.title,
    required this.listdata,
    required this.dropdownselectedname,
    required this.dropdownselectedid,
  });

  @override
  State<Customdropdownsearch> createState() => _CustomdropdownsearchState();
}

class _CustomdropdownsearchState extends State<Customdropdownsearch> {
  void showDrobdownsearch() {
    DropDownState(
      dropDown: DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: widget.listdata ?? [],

        onSelected: (List<dynamic> selectedItems) {
          SelectedListItem selectedListItem = selectedItems[0];
          widget.dropdownselectedname.text = selectedListItem.data;
          widget.dropdownselectedid.text = selectedListItem.value.toString();

        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,

      controller: widget.dropdownselectedname,
      cursorColor: Colors.black,readOnly: true,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDrobdownsearch();
      },validator: (value) {
      if (value == null || value.isEmpty) {
        return "312".tr;
      }
      return null;
    },


      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.dropdownselectedname.text == ""
            ? widget.title
            : widget.dropdownselectedname.text,
        hintStyle: TextStyle(fontSize: 14),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        label: Text( widget.dropdownselectedname.text == ""
            ? widget.title!
            : widget.dropdownselectedname.text,),
        suffixIcon: InkWell(onTap: (){},child: Icon(Icons.arrow_drop_down)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),







    );
  }
}
