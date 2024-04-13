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
  List<User> usersList = [];
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
    BlocProvider.of<MyCubit>(context).emitgetAllUsers();
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
              if (state is GetAllUsers) {
                usersList = state.allUsersList;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 50,
                        color: colors[index % colors.length],
                        child: Center(
                          child: Text(
                            usersList[index].name.toString(),
                          ),
                        ),
                      ),
                    );
                  },
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
