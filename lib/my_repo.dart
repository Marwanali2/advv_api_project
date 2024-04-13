import 'package:api_project/user.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    var responseList = await webServices
        .getAllUsers(); // contains list of all users (all the responseList)
    return responseList.map((signleUserMapFromJson) => User.fromJson(signleUserMapFromJson.toJson())).toList();
  }
}
