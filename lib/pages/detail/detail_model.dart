class PizzaDetail {
  final String name;
  final num price;
  final num star;
  final String image;

  PizzaDetail({required this.name, required this.price, required this.star, required this.image});

  factory PizzaDetail.fromJson(Map<String, dynamic> json) {
    return PizzaDetail(
      name: json['name'],
      price: json['price'],
      star: json['star'],
      image: json['image'],
    );
  }

}