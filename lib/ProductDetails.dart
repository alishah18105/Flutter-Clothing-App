import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:clothingstore/widgets/CirAv_Pd.dart';
import 'package:clothingstore/widgets/eleBut_Pd.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Productdetails extends StatefulWidget {
  final int index;
  
  final List<Map<String, dynamic>> selectedList;
  const Productdetails({super.key, required this.index, required this.selectedList});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int isSelected = 0;
String text = "S";

  void _updateCategory(int index) {
    setState(() {
      isSelected = index;
      switch(index){
        case 0:
        text = "S";

        case 1:
        text =  "M";

        case 2:
        text = "L";

        case 3:
        text = "XL";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
  final currencyFormat = NumberFormat.currency(locale: 'en_PK', symbol: 'PKR ');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset("assets/images/${widget.selectedList[widget.index]["image"]}", fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Male's Style", style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 10),
                  Text(
                    "${widget.selectedList[widget.index]["pdDetail"]}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF051054)),
                  ),
                  const SizedBox(height: 20),
                  const Text("Product Details", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF051054))),
                  const SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  const Text("Select Size", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF051054))),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElebutPd(text: "S", index: 0, onPressed: _updateCategory, isSelected: isSelected,),
                      ElebutPd(text: "M", index: 1,onPressed: _updateCategory, isSelected: isSelected),
                      ElebutPd(text: "L", index: 2,onPressed: _updateCategory, isSelected: isSelected),
                      ElebutPd(text: "XL",index: 3,onPressed: _updateCategory, isSelected: isSelected),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Select Color:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF051054))),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      CirAvPd(color: Colors.brown),
                      CirAvPd(color: Colors.blue),
                      CirAvPd(color: Colors.black),
                      CirAvPd(color: Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price", style: TextStyle(color: Colors.grey[600])),
                  Text(
                    "${currencyFormat.format(widget.selectedList[widget.index]["price"])}",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF051054)),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final existingItemIndex = listTile_data.indexWhere((item) => item["image"] == widget.selectedList[widget.index]["image"]);
                if (existingItemIndex == -1) {
                  listTile_data.add({
                    "image": widget.selectedList[widget.index]["image"],
                    "pdDetail": widget.selectedList[widget.index]["pdDetail"],
                    "price": widget.selectedList[widget.index]["price"],
                    "size" : text,
                    "count": 1,
                  });
                } else {
                  listTile_data[existingItemIndex]["count"]++;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.darkBlue,
                      content: Text("Item added to cart successfully", style: TextStyle(color: AppColors.white),),
                      action: SnackBarAction(label: "undo",textColor:AppColors.white, onPressed: (){}), 
                ));
              },
              child: Row(
                children: [
                  Icon(Icons.shopping_bag, color: AppColors.white),
                  SizedBox(width: 5),
                  Text("Add to Cart", style: TextStyle(color: AppColors.white)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
