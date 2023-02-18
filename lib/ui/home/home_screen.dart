import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFF7F2FF),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    autofocus: false,
                    onChanged: (value) {},
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      border: InputBorder.none,
                      filled: false,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Search by product name",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => ProductListItem(
                    image:
                        "https://d1ojphegpburrh.cloudfront.net/media/brand_images/supplyline_logo.png",
                    name: "Demo name",
                    buyingPrice: 200,
                    sellingPrice: 100,
                    profit: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final String image;
  final String name;
  final num buyingPrice;
  final num sellingPrice;
  final num profit;

  const ProductListItem({
    Key? key,
    required this.image,
    required this.name,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.profit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  image,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(0XFF323232),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "ক্রয়",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0XFF646464),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "৳ 20.00",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFDA2079),
                      ),
                    ),
                  ],
                ),
                Text(
                  "৳ 22.00",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFDA2079),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "বিক্রয়",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0XFF646464),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "৳ $sellingPrice",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFDA2079),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "লাভ",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0XFF646464),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "৳ $sellingPrice",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFDA2079),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
