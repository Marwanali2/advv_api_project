import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<User> usersList = [];
  User user = User();

  List<Color> colors = [
    Colors.blue,
    Colors.blue.shade800,
    Colors.blue.shade700,
    Colors.blue.shade600,
    Colors.blue.shade500,
    Colors.blue.shade400,
    Colors.blue.shade300,
    Colors.blue.shade200,
    Colors.blue.shade100,
    Colors.blue.shade50,
    Colors.blue,
  ];
  @override
  void initState() {
    // BlocProvider.of<MyCubit>(context).emitgetAllUsers();
    // BlocProvider.of<MyCubit>(context).emitgetUserDetails(6850117);
    // BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
    //   name: "maro",
    //   email: 'maro@gmail.com',
    //   gender: 'male',
    //   status: 'active',
    // ));
    BlocProvider.of<MyCubit>(context).emitdeleteUser(6850116);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: Column(
        children: [
          BlocBuilder<MyCubit, MyState>(
            builder: (context, state) {
              if (state is DeleteUser) {
                return Container(
                  height: 50, 
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                     state.data.toString(),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
