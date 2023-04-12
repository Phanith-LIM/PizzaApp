import 'dart:convert';

import 'package:pizza_food/core/base.dart';
import 'package:pizza_food/pages/home/Home_model.dart';
import 'package:pizza_food/xcore.dart';

abstract class IHomeRepository {
  Future<List<PizzaModel>?> getPizza();
}

class HomeRepository extends BaseRepository implements IHomeRepository {

  @override
  Future<List<PizzaModel>?> getPizza() async {
    final response = await get('$url/PizzaList', headers: headers);
    final data = await response.body['records'];
    if (data == null) return null;
    final list = <PizzaModel>[];
    data.forEach((value) {
      list.add(PizzaModel.fromJson(value));
    });
    return list;
  }
}