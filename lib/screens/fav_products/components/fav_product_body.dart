import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/fav_products/bloc/fav_product_cubit.dart';

class FavProductBody extends StatelessWidget {
  const FavProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavProductCubit, FavProductState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(kDefaultPadding),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                leading: Image.asset(product
                    .imageUrl), 
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.heartCircleMinus),
                  onPressed: () {
                    context.read<FavProductCubit>().toggleFavorite(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
