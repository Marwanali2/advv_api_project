import 'package:api_project/api_result.dart';
import 'package:api_project/network_exceptions.dart';
import 'package:api_project/user.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    //  return await webServices.getAllUsers();
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<User> getUserById(int userId) async {
    return await webServices.getUserById(userId);
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser,
          'Bearer 523f54c2fc9a3e8828136b527b6414ebe6575ff5c93424280b3cea43135a9201');
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<dynamic> deleteUser(int id) async {
    return await webServices.deleteUser(id,
        'Bearer 523f54c2fc9a3e8828136b527b6414ebe6575ff5c93424280b3cea43135a9201');
  }
}
