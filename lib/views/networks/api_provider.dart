import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_constant.dart';
import 'http_request.dart';
import '../../models/similarfoodresturantModel.dart';

String? locationName;
String? locationId;
bool resturantAdress = false;

List foodList = [];

List<SimilarFoodResturantModel> similarfoodresturantlist = [];

class ApiProvider {
  Future getResturantLocation() async {
    final prefs = await SharedPreferences.getInstance();
    resturantAdress = prefs.getBool('Resturant_bool') ?? true;

    locationName = prefs.getString('Resturant_Location');
  }

  void getLocationId() async {
    final prefs = await SharedPreferences.getInstance();
    locationId = prefs.getString('locationID');

    ApiRequest()
        .getLocationDetails(ApiConstant().baseUrl, ApiConstant().locationId, {
      'id': locationId,
      'YII_CSRF_TOKEN':
          'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw=='
    }).then((value) {
      getResturant(value.split("kmrs_local_id=")[1].split("; expires").first);
    });
  }

  void getResturant(String localid) {
    ApiRequest()
        .getResturants(
            ApiConstant().baseUrl,
            ApiConstant().getresturant,
            {
              'local_id': localid,
              'YII_CSRF_TOKEN':
                  'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw=='
            },
            localid)
        .then((value) {
      Map<String, dynamic> map = jsonDecode(value);

      // ignore: non_constant_identifier_names
      var cuisine_names = "";
      List r = map["details"]["data"];
      similarfoodresturantlist.clear();
      for (int i = 0; i < r.length; i++) {
        for (var abc in r[i]["cuisine_name"]) {
          // ignore: prefer_interpolation_to_compose_strings
          cuisine_names = cuisine_names + abc["cuisine_name"] + ',';
        }

        similarfoodresturantlist.add(
          SimilarFoodResturantModel(
            image: r[i]["url_logo"],
            resturnatName: r[i]["restaurant_name"],
            cuisine: cuisine_names,
            time: '30 min',
            distance: r[i]["distance"],
            rating: r[i]["ratings"]["rating"].toString(),
            merchatId: r[i]["merchant_id"],
          ),
        );
      }
    });
  }

  void getResturantfooditems(var merchantId) {
    ApiRequest().postRequest(
        ApiConstant().baseUrl, ApiConstant().getresturantfooditems, {
      'merchant_id': merchantId.toString(),
      'YII_CSRF_TOKEN':
          'MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw==',
    }).then((value) {
      // ignore: unused_local_variable

      Map<dynamic, dynamic> map = jsonDecode(value);

      var items = "";
      print(map["details"]["data"]["items"].toString());

      Map<dynamic, dynamic> map1 =
          jsonDecode(map["details"]["data"]["items"].toString());

      Map b = map1;

      for (int i = 0; i < b.length; i++) {
        print(b.toString());
      }
    });
  }
}
