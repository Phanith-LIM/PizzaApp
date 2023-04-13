
class PizzaModel {
  final String id;
  final String name;
  final String? description;
  final String image;
  final num price;
  final num star;

  PizzaModel({required this.id, required this.name, this.description, required this.image, required this.price, required this.star});

  factory PizzaModel.fromJson(Map<String, dynamic> json) {
    return PizzaModel(
      id: json['id'],
      name: json['fields']['name'],
      image: json['fields']['image'],
      price: json['fields']['price'],
      star: json['fields']['star'],
    );
  }
}

class SlideModel {
  final String id;
  final String image;

  SlideModel({required this.id, required this.image,});

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      id: json['id'],
      image: json['fields']['image'],
    );
  }
}