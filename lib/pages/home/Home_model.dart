
class PizzaModel {
  final String name;
  final String? description;
  final String image;
  final num price;
  final num star;

  PizzaModel({required this.name, this.description, required this.image, required this.price, required this.star});

  factory PizzaModel.fromJson(Map<String, dynamic> json) {
    return PizzaModel(
      name: json['fields']['Name'],
      image: json['fields']['Image'],
      price: json['fields']['Price'],
      star: json['fields']['Star'],
    );
  }
}