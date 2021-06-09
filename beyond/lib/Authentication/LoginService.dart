import 'dart:convert';
import 'dart:math';
import 'package:beyond/CustomWidget/Util/utils.dart';
import 'package:http/http.dart';
import '../Constant/EndPoint/EndPoint.dart';
import '../User/UserModel.dart';
class LoginApiProvider {
  final client = Client();

  LoginApiProvider();

  Future<String> getUiid(String email, String password) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Access-key': '${EndPoint.accessKey}'
    };
    //final request = "${EndPoint.login}?email=$email&password=${Uri.encodeComponent(password)}";
    Map<String, dynamic> param = {"email": "$email", "password": "$password"};
    //?email=$email&password=${Uri.encodeComponent(password)}
    var request =
        Uri.https("${EndPoint.baseUrl}", '${EndPoint.login}', param);
    final response = await client.post(request, headers: header);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> map = json.decode(response.body);
        return map['code'].toString();
      } catch (e) {
        User user = new User();
        user.token = response.body.replaceAll("\\", "").replaceAll("\"", "");
        Utils.updateConnectedUser(user);
        return user.token;
      }
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<User> getUserInfo(String uiId) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Access-key': '${EndPoint.accessKey}',
      'Session-Key': uiId
    };

    var request = Uri.https("${EndPoint.baseUrl}", '${EndPoint.userInfo}');
    final response = await client.get(request, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      User user = new User();
      user = User.fromJson(map);
      user.token = uiId;
      var random = new Random();

      String url = user.avatar;
      user.avatar = url + "?lettuce" + random.nextInt(100).toString();

      Utils.updateConnectedUser(user);
      print(user.token);
      return user;
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<int> checkEmail(String email) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Access-key': '${EndPoint.accessKey}'
    };
    Map<String, dynamic> param = {
      "email": "$email",
    };
    //?email=$email&password=${Uri.encodeComponent(password)}
    var request =
        Uri.https("${EndPoint.baseUrl}", '${EndPoint.checkEmail}', param);
    final response = await client.get(request, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map['code'];
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
