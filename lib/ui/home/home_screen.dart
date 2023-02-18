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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  children: [
                    Text("Hi"),
                    Text("Hi"),
                    Text("Hi"),
                    Text("Hi"),
                    Text("Hi"),
                    Text("Hi"),
                    Text("Hi"),
                  ],
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
  final String? image;
  final String? name;
  final num? buyingPrice;
  final num? sellingPrice;
  final num? profit;
  const ProductListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

