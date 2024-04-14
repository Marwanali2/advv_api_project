import 'package:api_project/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET('users')
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUserById(
      @Path('id')
      int id); // كده هو فهم ان ال id عبارة عن path و هيبدله بالid الرقم بتاعي

  @POST('users')
  Future<User> createNewUser(
      @Body() User newUser, @Header('Authorization') String token);

  @DELETE('users/{id}')
  Future<dynamic> deleteUser(@Path('id') int id,@Header('Authorization') String token);
}
