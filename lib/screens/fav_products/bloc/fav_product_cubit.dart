import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavProduct {
  final String imageUrl;
  final String title;
  final double price;

  const FavProduct({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}
class FavProductState extends Equatable {
  final List<FavProduct> products;

  const FavProductState({this.products = const []});

  @override
  List<Object?> get props => [products];
}
class FavProductCubit extends Cubit<FavProductState> {
  FavProductCubit() : super(const FavProductState(products: []));

  void toggleFavorite(FavProduct product) {
    final currentProducts = List<FavProduct>.from(state.products);

    if (currentProducts.contains(product)) {
      currentProducts.remove(product); 
    } else {
      currentProducts.add(product); 
    }

    emit(FavProductState(products: currentProducts));
  }
  void clearFavorites() {
    emit(const FavProductState());
  }
}
