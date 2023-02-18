import 'package:e_commerce/ui/details/details_screen.dart';
import 'package:e_commerce/ui/home/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "home";

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
                              hintText: "সার্চ করুন",
                              suffixIcon: Icon(
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      results: state.productList[index],
                                    ),
                                  ));
                            },
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
