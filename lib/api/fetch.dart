import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleproject/api/Items.dart';

Future<dynamic> getInfByApi() async {
  http.Response res = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );

  var data = json.decode(res.body);
  for (var item in data) {
    getItemsByApi.add(Items.fromjson(item));
  }

  return getItemsByApi;
}
