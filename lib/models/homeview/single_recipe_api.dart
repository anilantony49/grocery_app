import 'dart:convert';
import 'package:grocery_list_app/models/homeview/single_recipe.dart';
import 'package:http/http.dart' as http;

class ExclusiveOfferApi {
// const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
  // 'X-RapidAPI-Key': 'a01a4d77bamsh11cbf12cfdf3756p18bc66jsn87b2eb1f0d38',
  // 'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
// });

  static Future<List<SingleRecipe>> getExclusive() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'a01a4d77bamsh11cbf12cfdf3756p18bc66jsn87b2eb1f0d38',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return SingleRecipe.exclusiveFromSnapshot(_temp);
  }
}

// class GenericFoodApi {
// // const unirest = require('unirest');

// // const req = unirest('GET', 'https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser');

// // req.query({
// // 	'nutrition-type': 'cooking',
// // 	'category[0]': 'generic-foods',
// // 	'health[0]': 'alcohol-free'
// // });

// // req.headers({
// // 	'X-RapidAPI-Key': 'a01a4d77bamsh11cbf12cfdf3756p18bc66jsn87b2eb1f0d38',
// // 	'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com'
// // });
//   static Future<List<GenericFood>> getGenericFood() async {
//     var uri = Uri.https('edamam-food-and-grocery-database.p.rapidapi.com',
//         '/api/food-database/v2/parser', {
//       'nutrition-type': 'cooking',
//       'category[0]': 'generic-foods',
//       'health[0]': 'alcohol-free',
//     });
//     final response = await http.get(uri, headers: {
//       'X-RapidAPI-Key': 'a01a4d77bamsh11cbf12cfdf3756p18bc66jsn87b2eb1f0d38',
//       'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com',
//     });

//     Map data = jsonDecode(response.body);
//     List temp = [];

//     for (var i in data['hints']) {
//       temp.add(i['food']);
//     }

//     return GenericFood.genericFoodFromSnapshot(temp);
//   }
// }
