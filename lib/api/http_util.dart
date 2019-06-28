import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'api.dart';

/*数据接口类型errorCode>0是接口请求成功
{
"data": ...,
"errorCode": 0,
"errorMsg": ""
}
*/

//class Api {
//  static const String BaseUrl = "http://www.wanandroid.com/";
//}

//这里只封装了常见的get和post请求类型,不带Cookie
class HttpUtil {
  static const String GET = "get";
  static const String POST = "post";

  static  get(String url,
      {Map<String, String> params,
      Map<String, String> headers}) async {

    if (!url.startsWith("http")) {
      url = Api.BaseUrl + url;
    }

    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    return await _request(url,
        method: GET, headers: headers);
  }

  static post(String url,
      {Map<String, String> params,
      Map<String, String> headers}) async {
    if (!url.startsWith("http")) {
      url = Api.BaseUrl + url;
    }
   return await _request(url,
        method: POST,
        headers: headers,
        params: params);
  }

  static  _request(String url,
      {String method,
      Map<String, String> headers,
      Map<String, String> params}) async {

    var data;
    try {
      Map<String, String> headerMap = headers == null ? new Map() : headers;
      Map<String, String> paramMap = params == null ? new Map() : params;

      //统一添加cookie(写在这是不是也有些不优雅)
      SharedPreferences sp = await SharedPreferences.getInstance();
//      if(UserManager.INSTANCE.isLogin()){
//        headerMap['Cookie'] = UserManager.INSTANCE.cookie;
//      }

      http.Response res;
      if (POST == method) {
        print("POST:URL=" + url);
        print("POST:BODY=" + paramMap.toString());
        res = await http.post(url, headers: headerMap, body: paramMap);
      } else {
        print("GET:URL=" + url);
        res = await http.get(url, headers: headerMap);
      }

      print("res = "+res.toString());

      if (res.statusCode != 200) {
//        errorMsg = "网络请求错误,状态码:" + res.statusCode.toString();
//
//        _handError(errorCallback, errorMsg);
        return null;
      }

//      if(url.contains(Api.LOGIN)){
//        UserManager.INSTANCE.setCookic(res.headers['set-cookie']);
//      }

      //以下部分可以根据自己业务需求封装,这里是errorCode>=0则为请求成功,data里的是数据部分
      //记得Map中的泛型为dynamic
      Map<String, dynamic> map = json.decode(res.body);

      data = map['data'];
      return data;
    } catch (exception) {
      return null;
    }
  }


}
