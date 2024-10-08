import 'package:http/http.dart' as http;

import '../Model/model.dart';


getProducts() async {
  var response = await http.get(Uri.parse("https://dummyjson.com/products"));
  try {
    if (response.statusCode == 200) {
      var data = productModelFromJson(response.body);
      return data.products;
    } else {
      print("If any any error occur");
    }
  } catch (e) {
    print(e.toString());
  }
}
