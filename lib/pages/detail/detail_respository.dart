import 'package:pizza_food/xcore.dart';

abstract class IDetailRepository {
  Future<PizzaDetail?> getDetail(String pizzaId);
}

class DetailRepository extends BaseRepository implements IDetailRepository {

  @override
  Future<PizzaDetail?> getDetail(String pizzaId) async {
    final response = await get('$url/PizzaList/$pizzaId', headers: headers);
    final data = await response.body['fields'];
    print(data['time']);
    if (data == null) return null;
    return PizzaDetail.fromJson(data);
  }
}