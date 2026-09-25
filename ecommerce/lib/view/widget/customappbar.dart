import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final String titleappbar;
  final void Function(String)? onChanged;
  final void Function()? onPressediconfavorite;
  final void Function()? onPressediconsearch;
  final void Function()? onPressedicondelete;
  final TextEditingController mycontroller;

  const Customappbar({
    super.key,
    required this.titleappbar,
    this.onPressediconsearch,
    required this.onPressediconfavorite,
    required this.onPressedicondelete,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: titleappbar ,
                hintStyle: TextStyle(fontSize: 18,),
                prefixIcon: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100],
                  fixedSize: Size(10, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),padding: EdgeInsets.zero
                ),
                  onPressed: onPressediconsearch,

                  child: Icon(Icons.search,size: 22,),
                ),
                suffixIcon: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200],
                    fixedSize: Size(10, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),padding: EdgeInsets.zero
                ),
                 child:  Icon(Icons.delete_forever_outlined,size: 22,),
                  onPressed: onPressedicondelete,
                ),

                border: OutlineInputBorder(

                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressediconfavorite,
              icon: Icon(Icons.favorite, size: 30, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 10),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: mycontroller,
//                   onChanged: onChanged,
//                   decoration: InputDecoration(
//                     prefixIcon: IconButton(
//                       onPressed: onPressediconsearch,
//                       icon: Icon(Icons.search),
//                     ),
//                     hintText: titleappbar,
//                     hintStyle: TextStyle(fontSize: 18),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 width: 60,
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: IconButton(
//                   onPressed: onPressediconfavorite,
//                   icon: Icon(
//                     Icons.favorite_border_outlined,
//                     size: 30,
//                     color: AppColor.primaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // قائمة الاقتراحات
//         GetBuilder<Searchmixcontroller>(
//           builder: (controller) => Container(
//             margin: EdgeInsets.only(top: 5),
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: controller.suggestions.map((ItemsModel item) {
//                 return ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   title: Text(
//                     item.itemsName!,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   subtitle: Text(
//                     "${item.itemspricediscount}\$",
//                     style: TextStyle(color: AppColor.primaryColor),
//                   ),
//                   onTap: () {
//                     controller.searchSelectedItem(item);
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
