import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = "welcome";

  final Results results;

  const DetailsScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(results: results));
  }
}

class Body extends StatefulWidget {
  final Results results;

  const Body({Key? key, required this.results}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: const Color(0xFFF7F2FF),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'প্রোডাক্ট ডিটেইল',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10,),
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
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 5),
                  border: InputBorder.none,
                  filled: false,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),

        ],
      ),
    ));
  }
}
