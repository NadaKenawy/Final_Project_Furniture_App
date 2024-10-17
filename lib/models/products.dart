class Product {
  final int id;
  final double price;
  final String title, description, image;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
  });
}

class ChairProduct extends Product {
  ChairProduct({
    required super.id,
    required super.price,
    required super.title,
    required super.description,
    required super.image,
  });
}

class TableProduct extends Product {
  TableProduct({
    required super.id,
    required super.price,
    required super.title,
    required super.description,
    required super.image,
  });
}

class DecorationProduct extends Product {
  DecorationProduct({
    required super.id,
    required super.price,
    required super.title,
    required super.description,
    required super.image,
  });
}
