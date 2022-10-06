import 'package:http/http.dart' as http;

class ApiRequest {
  String response = '';
  Future<String> postRequest(
    String baseUrl,
    String api,
    var body,
  ) async {
    await http
        .post(Uri.parse(baseUrl + api),
            headers: <String, String>{
              'Host': 'lieferlein.de',
              'Cookie':
                  'PHPSESSID=25c037s6kli4cd072fho53nalv; YII_CSRF_TOKEN=1e4a908165fe8964e954c34f40733c5454ca7ec9s%3A88%3A%22MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw%3D%3D%22%3B',
              'User-Agent':
                  'Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',
              'Accept': 'application/json, text/javascript, /; q=0.01',
              'Accept-Language': 'en-US,en;q=0.5',
              'Accept-Encoding': 'gzip, deflate',
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              "Origin": 'https://lieferlein.de',
              "Referer": 'https://lieferlein.de/',
              "Sec-Fetch-Dest": 'empty',
              "Sec-Fetch-Mode": 'cors',
              "Sec-Fetch-Site": 'same-origin',
              "Te": 'trailers'
            },
            body: body)
        .then((value) {
      if (value.statusCode != 200) {
        response = "Network Error!";
      } else {
        response = value.body;
      }
    });
    return response;
  }

  Future<String> getResturants(
    String baseUrl,
    String api,
    var body,
    var localid,
  ) async {
    await http
        .post(Uri.parse(baseUrl + api),
            headers: <String, String>{
              'Host': 'lieferlein.de',
              'Cookie':
                  // ignore: prefer_interpolation_to_compose_strings
                  'PHPSESSID=25c037s6kli4cd072fho53nalv; YII_CSRF_TOKEN=1e4a908165fe8964e954c34f40733c5454ca7ec9s%3A88%3A%22MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw%3D%3D%22%3B' +
                      '; kmrs_local_id=' +
                      localid +
                      ';',
              'User-Agent':
                  'Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',
              'Accept': 'application/json, text/javascript, /; q=0.01',
              'Accept-Language': 'en-US,en;q=0.5',
              'Accept-Encoding': 'gzip, deflate',
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              "Origin": 'https://lieferlein.de',
              "Referer": 'https://lieferlein.de/',
              "Sec-Fetch-Dest": 'empty',
              "Sec-Fetch-Mode": 'cors',
              "Sec-Fetch-Site": 'same-origin',
              "Te": 'trailers'
            },
            body: body)
        .then((value) {
      if (value.statusCode != 200) {
        response = "Network Error!";
      } else {
        response = value.body;
      }
    });
    return response;
  }

  Future<String> getLocationDetails(
      String baseUrl, String api, var body) async {
    await http
        .post(Uri.parse(baseUrl + api),
            headers: <String, String>{
              'Host': 'lieferlein.de',
              'Cookie':
                  'PHPSESSID=25c037s6kli4cd072fho53nalv; YII_CSRF_TOKEN=1e4a908165fe8964e954c34f40733c5454ca7ec9s%3A88%3A%22MVhvWmltTnRVY1FzTUVMb1RGQnBWcEdCTTYyazZGMGxIvxpxNjovK4-kr_5f_OGYzN8wZ2f8NtDlCmo9POieVw%3D%3D%22%3B',
              'User-Agent':
                  'Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',
              'Accept': 'application/json, text/javascript, /; q=0.01',
              'Accept-Language': 'en-US,en;q=0.5',
              'Accept-Encoding': 'gzip, deflate',
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              "Origin": 'https://lieferlein.de',
              "Referer": 'https://lieferlein.de/',
              "Sec-Fetch-Dest": 'empty',
              "Sec-Fetch-Mode": 'cors',
              "Sec-Fetch-Site": 'same-origin',
              "Te": 'trailers'
            },
            body: body)
        .then((value) {
      if (value.statusCode != 200) {
        response = "Network Error!";
      } else {
        response = value.headers.toString();
      }
    });
    return response;
  }
}
