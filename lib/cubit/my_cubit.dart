import 'package:api_project/cubit/result_state.dart';
import 'package:api_project/my_repo.dart';
import 'package:api_project/network_exceptions.dart';
import 'package:api_project/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class MyCubit extends Cubit<ResultState<User>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(Idle());

  // void emitgetAllUsers() async {
  //   var data = await myRepo.getAllUsers();
  //   data.when(
  //     success: (List<User> allUsers) {
  //       emit(ResultState.success(allUsers));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ResultState.error(networkExceptions));
  //     },
  //   );
  //   // myRepo.getAllUsers().then((usersList) {
  //   //   emit(GetAllUsers(usersList));
  //   // });
  // }

  // void emitgetUserDetails(int userId) {
  //   myRepo.getUserById(userId).then((userDetails) {
  //     emit(GetUserDetails(userDetails));
  //   });
  // }

  void emitCreateNewUser(User newUser) async {
    var data = await myRepo.createNewUser(newUser);
    data.when(
      success: (User userData) {
        emit(ResultState.success(userData));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );

    // myRepo.createNewUser(newUser).then((newUser) {
    //   emit(CreateNewUser(newUser));
    // });
  }

  // void emitdeleteUser(int id) {
  //   myRepo.deleteUser(id).then((data) {
  //     emit(DeleteUser(data));
  //   });
  // }
}
