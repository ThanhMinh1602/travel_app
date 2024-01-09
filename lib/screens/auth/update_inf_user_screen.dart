import 'package:flutter/material.dart';
import 'package:travel_app/screens/auth/widgets/tv_appbar.dart';

class UpdateInfUser extends StatefulWidget {
  const UpdateInfUser({super.key});

  @override
  State<UpdateInfUser> createState() => _UpdateInfUserState();
}

class _UpdateInfUserState extends State<UpdateInfUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TvAppBar(),
      body: Column(
        children: [       
          PageView(
            children: [],
          ),
        ],
      ),
    );
  }
}
