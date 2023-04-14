class PizzaDetail {
  final String name;
  final num price;
  final num star;
  final num kal;
  final num time;
  final String image;
  final String description;

  PizzaDetail({required this.name, required this.price, required this.star, required this.image, required this.time, required this.kal, required this.description});

  factory PizzaDetail.fromJson(Map<String, dynamic> json) {
    return PizzaDetail(
      name: json['name'][0],
      time: json['time'],
      kal: json['kal'],
      price: json['price'][0],
      star: json['star'][0],
      image: json['image'][0],
      description: json['description'],
    );
  }

}