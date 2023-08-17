// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/apidata.dart';

import '../model/user_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  bool listState = false;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiData().getUserData());
    setState(() {
      if (_userModel == null || _userModel!.isEmpty) {
        listState = true;
      }
    });
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),centerTitle: true,
      ),
      body: listState
          ? Center(child: const CircularProgressIndicator())
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                    child: User(
                        id: _userModel![index].id,
                        name: _userModel![index].username,
                        mail: _userModel![index].email,
                        web: _userModel![index].website));
              },
            ),
    );
  }
}

class User extends StatelessWidget {
  final int id;
  final String name, mail, web;
  const User(
      {super.key,
      required this.id,
      required this.name,
      required this.mail,
      required this.web});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(id.toString() , style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mail),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(web),
          ),
        ],
      ),
    );
  }
}
