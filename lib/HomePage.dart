import 'package:clothingstore/ProductDetails.dart';
import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:clothingstore/widgets/CirAv_Hp.dart';
import 'package:clothingstore/widgets/GridView_Hp.dart';
import 'package:clothingstore/widgets/bottom_navigation.dart';
import 'package:clothingstore/widgets/eleBut_Hp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async'; // Import Timer class


final currencyFormat = NumberFormat.currency(locale: 'en_PK', symbol: 'PKR ');
int isSelected = 0;

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> selectedList = [];
  final PageController _controller = PageController();
  Timer? _pageTimer;

  void _updateCategory(int index) {
    setState(() {
      isSelected = index;
    });
  }

  Widget _buildAllProduct() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 160),
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
      ),
      itemCount: selectedList.length,
      itemBuilder: (context, i) {
        bool isFavorite = fav.any((item) => item["image"] == selectedList[i]["image"]);

        return GestureDetector(
          child: Stack(
            children: [
              GridViewHP(
                images: selectedList[i]["image"],
                product_title: selectedList[i]["pdDetail"],
                price: currencyFormat.format(selectedList[i]["price"]),
                 rating: selectedList[i]["rate"].toString(),
              ),
              Positioned(
                top: 5,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: GestureDetector(
                    onTap: () {
                      final existingItemIndex = fav.indexWhere((item) => item["image"] == selectedList[i]["image"]);

                      setState(() {
                        if (existingItemIndex == -1) {
                          fav.add({
                            "image": selectedList[i]["image"],
                            "pdDetail": selectedList[i]["pdDetail"],
                            "price": selectedList[i]["price"],
                          });
                        } else {
                          fav.removeAt(existingItemIndex);
                        }
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.darkBlue,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Productdetails(index: i, selectedList: selectedList),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectedProductGrid() {
    switch (isSelected) {
      case 3:
        selectedList = men;
        return _buildAllProduct();
      case 4:
        selectedList = women;
        return _buildAllProduct();
      default:
        selectedList = data;
        return _buildAllProduct();
    }
  }

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _pageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_controller.hasClients) {
        int nextPage = (_controller.page?.toInt() ?? 0) + 1;
        if (nextPage >= 4) {
          nextPage = 0; 
        }
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageTimer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location",style: TextStyle(color: Colors.grey[600], fontSize: 15),),
                    SizedBox( height: 5),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.darkBlue),
                          Text("Karachi", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(","),
                          Text("  Pakistan"),
                          Icon(Icons.keyboard_arrow_down_outlined, size: 20,),
                          
                          SizedBox(width: 120,),
                          Expanded(
                            child: CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xFF051054),
                            child: Badge.count(
                            count: 10,
                            child: const Icon(Icons.notifications, color: Colors.white)),
                          ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:  BorderSide(color: AppColors.darkBlue),
                          ),
                          prefixIcon: Icon(Icons.search, color: AppColors.darkBlue),
                          hintText: "Search",
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFF051054),
                      child: const Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: PageView(
                      controller:  _controller,
                      children: [
                        Image.asset("assets/images/banner1.jpg", fit: BoxFit.cover),
                        Image.asset("assets/images/banner2.JPG", fit: BoxFit.cover),
                        Image.asset("assets/images/banner4.JPG", fit: BoxFit.cover),
                        Image.asset("assets/images/banner3.jpg", fit: BoxFit.cover),
                      ],
                    ),
                    height: 130,
                    width: 350,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: SwapEffect(
                      activeDotColor: AppColors.darkBlue,
                      offset: 16,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CaHp(image: "tshirt.png"),
                    CaHp(image: "trousers.png"),
                    CaHp(image: "dress.png"),
                    CaHp(image: "jacket.png"),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EleButtHp(text: "All", index: 0, onPressed: _updateCategory),
                      EleButtHp(text: "Popular", index: 1, onPressed: _updateCategory),
                      EleButtHp(text: "Newest", index: 2, onPressed: _updateCategory),
                      EleButtHp(text: "Men", index: 3, onPressed: _updateCategory),
                      EleButtHp(text: "Women", index: 4, onPressed: _updateCategory),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildSelectedProductGrid(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(bottomIndex: 0),
    );
  }
}
