import 'package:e_commerce/bloc/product_bloc.dart';
import 'package:e_commerce/data/repository/product_repo_impl.dart';
import 'package:e_commerce/data/source/product_service.dart';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:e_commerce/utils/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = "welcome";

  final Results results;

  const DetailsScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          ProductBloc(repository: ProductRepoImpl(ProductService())),
      child: Body(results: results),
    ));
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
  void initState() {
    super.initState();
    print('_BodyState.initState:: Slug: ${widget.results.slug}');
    context.read<ProductBloc>().add(FetchProductDetails(widget.results.slug));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
          case HomeStatus.loading:
          case HomeStatus.productListFetched:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeStatus.error:
            return Center(
              child: Text(state.errorMsg),
            );
          case HomeStatus.productDetailsFetched:
            return SingleChildScrollView(
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36, right: 36),
                      child: Image.network(
                        state.productDetails?.data?.image ?? "",
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, stackTrace) =>
                            Image.asset(
                          "assets/icons/no_image.jpeg",
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      state.productDetails?.data?.productName ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0XFF19181B)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "ব্রান্ডঃ ",
                                style:
                                    const TextStyle(color: Color(0XFF646464)),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      state.productDetails?.data?.brand?.name ??
                                          "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF19181B)))
                            ])),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset('assets/icons/circle_pink.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "সেলার: ",
                            style: const TextStyle(color: Color(0XFF646464)),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      state.productDetails?.data?.seller ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF19181B)))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                const Text(
                                  'ক্রয়মূল্যঃ',
                                  style: TextStyle(
                                      color: Color(0XFFDA2079),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Text(
                                  '৳ ${state.productDetails?.data?.charge?.currentCharge}',
                                  style: const TextStyle(
                                      color: Color(0XFFDA2079),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                const Text(
                                  'বিক্রয়মূল্যঃ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Text(
                                  '৳ ${state.productDetails?.data?.charge?.sellingPrice}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const DottedDivider(color: Colors.grey,),
                            const SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                const Text(
                                  'লাভঃ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Text(
                                  '৳ ${state.productDetails?.data?.charge?.profit}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    const Text('বিস্তারিত',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 8,
                    ),
                    Html(data: state.productDetails?.data?.description)
                  ],
                ),
              ),
            );
        }
      },
    ));
  }
}
