import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListItem extends StatelessWidget {
  final String image;
  final String name;
  final num buyingPrice;
  final num sellingPrice;
  final num profit;
  final GestureTapCallback onTap;

  const ProductListItem({
    Key? key,
    required this.image,
    required this.name,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.profit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    errorBuilder: (context, object, stackTrace) => Image.asset(
                      "assets/icons/no_image.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
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
                      const Text(
                        overflow: TextOverflow.ellipsis,
                        "ক্রয়",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0XFF646464),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
                      const SizedBox(
                        width: 5,
                      ),
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
                      const SizedBox(
                        width: 2,
                      ),
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
