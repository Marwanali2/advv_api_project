import 'package:api_project/my_repo.dart';
import 'package:api_project/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(MyInitial());

  void emitgetAllUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }


  void emitgetUserDetails(int userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) {
    myRepo.createNewUser(newUser).then((newUser) {
      emit(CreateNewUser(newUser));
    });
  }

    void emitdeleteUser(int id) {
    myRepo.deleteUser(id).then((data) {
      emit(DeleteUser(data));
    });
  }

}
