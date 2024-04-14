import 'package:api_project/user.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    return await webServices.getAllUsers(); 
   
  }

 Future<User> getUserById(int userId) async {
     return await webServices.getUserById(userId);  
  }

 Future<User> createNewUser(User newUser) async {
     return await webServices.createNewUser(newUser, 'Bearer 523f54c2fc9a3e8828136b527b6414ebe6575ff5c93424280b3cea43135a9201');
  }
   Future<dynamic> deleteUser(int id) async {
     return await webServices.deleteUser(id, 'Bearer 523f54c2fc9a3e8828136b527b6414ebe6575ff5c93424280b3cea43135a9201');
  }
}
