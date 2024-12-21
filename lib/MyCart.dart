import 'package:clothingstore/checkout.dart';
import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:clothingstore/widgets/TextTheme.dart';
import 'package:clothingstore/widgets/bottom_navigation.dart';
import 'package:clothingstore/widgets/eleBut_Mc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class MyCart extends StatefulWidget {

  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  double deliveryfee = 200;
  double discount = 0.0;

  void _increaseCount(int index) {
    setState(() {
      listTile_data[index]["count"]++;
    });
  }

  void _decreaseCount(int index) {
    if (listTile_data[index]["count"] > 1) {
      setState(() {
        listTile_data[index]["count"]--;
      });
    }
    else{
      setState(() {
        listTile_data.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_PK', symbol: 'PKR ');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("My Cart",style: TextStyle(color: AppColors.darkBlue),)),
      ),
      body: ListView.builder(
        itemCount: listTile_data.length,
        itemBuilder: (BuildContext context, int index) {
          final itemPrice = listTile_data[index]["price"];
          final itemCount = listTile_data[index]["count"];
          final subtotal = itemPrice * itemCount;
          final totalPrice = subtotal + discount + deliveryfee;

          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 20),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(color: AppColors.darkBlue
                                        ),
                                      ),
                                      hintText: "Promo Code",
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBlue),
                                  child: Text("Apply Code", style: TextStyle(color: AppColors.white)),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub-Total", style: cart),
                                Text(currencyFormat.format(subtotal), style: cartPrice),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee", style: cart),
                                Text(currencyFormat.format(deliveryfee), style: cartPrice),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Discount", style: cart),
                                Text(currencyFormat.format(discount), style: cartPrice),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Cost", style: cart),
                                Text(currencyFormat.format(totalPrice), style: cartPrice),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckOut()));
                              },
                              child: Text("Proceed To Checkout", style: TextStyle(color: AppColors.white, fontSize: 15)),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 11),
                                backgroundColor: AppColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Slidable(
                    endActionPane: ActionPane(motion: const ScrollMotion(), 
                    children: [
                    SlidableAction(onPressed: (context){
                      setState(() {
                        listTile_data.removeAt(index);
                      }
                      );  
                    },
                    backgroundColor: AppColors.darkBlue,
                    foregroundColor: AppColors.white,
                    icon: Icons.delete,
                    
                    )
                    ]),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Image.asset(
                            "assets/images/${listTile_data[index]["image"]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        "${listTile_data[index]["pdDetail"]}",
                        style: TextStyle(color: AppColors.darkBlue),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${listTile_data[index]["size"]}", 
                            style: TextStyle(color: AppColors.grey, fontSize: 10),
                          ),
                          Text(
                            currencyFormat.format(itemPrice),
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EleBut_Mc(
                              text: "-",
                              tcolor: AppColors.black,
                              bcolor: AppColors.lightgrey,
                              onPressed: () => _decreaseCount(index),
                            ),
                            Text("${listTile_data[index]["count"]}"),
                            EleBut_Mc(
                              text: "+",
                              tcolor: AppColors.white,
                              bcolor: AppColors.darkBlue,
                              onPressed: () => _increaseCount(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:const BottomNav(bottomIndex: 1,),
    );
  }
}
