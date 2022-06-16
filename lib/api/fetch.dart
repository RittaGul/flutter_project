import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleproject/api/Items.dart';

/////////// من نوع future لان ح تنتظر
Future<dynamic> getInfByApi() async {
  http.Response res = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );
////////بيسحب البيانات كلها و بخزنها بقلب الداتا
  var data = json.decode(res.body);
  for (var item in data) {
    getItemsByApi.add(Items.fromjson(item));
  }

  return getItemsByApi;
}
