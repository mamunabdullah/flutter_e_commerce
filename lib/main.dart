import 'package:e_commerce/data/repository/product_repo_impl.dart';
import 'package:e_commerce/data/source/product_service.dart';
import 'package:e_commerce/ui/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => HomeBloc(repository: ProductRepoImpl(ProductService()))
          ..add(
            const SearchProductsEvent(""),
          ),
        child: const HomeScreen(),
      ),
    );
  }
}
