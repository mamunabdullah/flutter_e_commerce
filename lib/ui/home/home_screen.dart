import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
            case HomeStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeStatus.success:
              return Container(
                color: const Color(0xFFF7F2FF),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 8, top: 80),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
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
                      const SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.productList.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) => ProductListItem(
                            image: state.productList[index].image ?? "",
                            name: state.productList[index].productName ?? "",
                            buyingPrice: state
                                    .productList[index].charge?.currentCharge ??
                                0,
                            sellingPrice:
                                state.productList[index].charge?.sellingPrice ??
                                    0,
                            profit:
                                state.productList[index].charge?.profit ?? 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case HomeStatus.error:
              return Center(
                child: Text(state.errorMsg),
              );
          }
        },
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
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Image.network(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, object, stackTrace) =>
                        Image.asset("assets/icons/no_image.jpeg",width: 100,height: 100,fit: BoxFit.cover,),
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0XFF323232),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "ক্রয়",
                        style: TextStyle(
                            fontSize: 10,
                            color: const Color(0XFF646464),
                            fontFamily: GoogleFonts.mina().fontFamily),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "৳ $buyingPrice",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFFDA2079),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    "৳ 2200.00",
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        "বিক্রয়",
                        style: TextStyle(
                            fontSize: 10,
                            color: const Color(0XFF646464),
                            fontFamily: GoogleFonts.mina().fontFamily),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        "৳ $sellingPrice",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFFDA2079),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        "লাভ",
                        style: TextStyle(
                            fontSize: 10,
                            color: const Color(0XFF646464),
                            fontFamily: GoogleFonts.mina().fontFamily),
                      ),
                      const SizedBox(width: 2,),
                      Text(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        "৳ $profit",
                        style: const TextStyle(
                          fontSize: 14,
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
      ),
    );
  }
}

//
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.network(
// image,
// width: 100,
// height: 100,
// fit: BoxFit.cover,
// errorBuilder: (context,object,stackTrace) => const Text("error"),
// ),
// ],
// ),
// Text(
// overflow: TextOverflow.ellipsis,
// name,
// style: TextStyle(
// color: const Color(0XFF323232),
// fontWeight: FontWeight.bold,
// fontSize: 14,
// fontFamily: GoogleFonts.mina().fontFamily),
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: [
// Text(
// overflow: TextOverflow.ellipsis,
// "ক্রয়",
// style: TextStyle(
// fontSize: 10,
// color: const Color(0XFF646464),
// fontFamily: GoogleFonts.mina().fontFamily),
// ),
// const SizedBox(
// width: 5,
// ),
// Text(
// overflow: TextOverflow.ellipsis,
// "৳ $buyingPrice",
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w700,
// color: Color(0XFFDA2079),
// ),
// ),
// ],
// ),
// const Text(
// overflow: TextOverflow.ellipsis,
// "৳ 22.00",
// style: TextStyle(
// decoration: TextDecoration.lineThrough,
// fontSize: 12,
// fontWeight: FontWeight.w500,
// color: Color(0XFFDA2079),
// ),
// )
// ],
// ),
// Row(
// children: [
// SizedBox(
// width: 80,
// child: Row(
// children: [
// const Text(
// overflow: TextOverflow.ellipsis,
// "বিক্রয়",
// style: TextStyle(
// fontSize: 10,
// color: Color(0XFF646464),
// ),
// ),
// const SizedBox(
// width: 5,
// ),
// Text(
// overflow: TextOverflow.clip,
// "৳ $sellingPrice",
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w700,
// color: Color(0XFFDA2079),
// ),
// ),
// ],
// ),
// ),
// SizedBox(
// width: 81,
// child: Row(
// children: [
// const Text(
// overflow: TextOverflow.ellipsis,
// "লাভ",
// style: TextStyle(
// fontSize: 10,
// color: Color(0XFF646464),
// ),
// ),
// const SizedBox(
// width: 5,
// ),
// Text(
// overflow: TextOverflow.ellipsis,
// "৳ $profit",
// style: const TextStyle(
// overflow: TextOverflow.ellipsis,
// fontSize: 16,
// fontWeight: FontWeight.w700,
// color: Color(0XFFDA2079),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
