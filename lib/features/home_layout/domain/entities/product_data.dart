import 'package:equatable/equatable.dart';

class ProductData extends Equatable{
  final String name;
  final String image;
  final String description;
  final double price;
  final double rate;


  const ProductData({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rate,});

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,price,description,rate,image
  ];
}