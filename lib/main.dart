import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/firebase_options.dart';
import 'package:furniture_app/screens/auth/login_page.dart';
import 'package:furniture_app/screens/auth/sign_up.dart';
import 'package:furniture_app/screens/cart/bloc/cart_cubit.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/fav_products/fav_product_screen.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:furniture_app/screens/search/search_scareen.dart';
import 'package:furniture_app/screens/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_app/screens/fav_products/bloc/fav_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FurnitureApp());
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => FavProductCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          SignUpPage.id: (context) => const SignUpPage(),
          DetailsScreen.id: (context) => const DetailsScreen(),
          ProductsScreen.id: (context) => const ProductsScreen(),
          CartScreen.id: (context) => const CartScreen(),
          SearchScareen.id: (context) => const SearchScareen(),
          FavoritesScreen.id: (context) => const FavoritesScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
        },
        title: 'Furniture app',
        theme: ThemeData(
          textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme),
          primaryColor: kBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
