// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map witherMap = {};

  @override
  Widget build(BuildContext context) {
    witherMap = witherMap.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : witherMap;

    String dayOrNight = witherMap["bgImage"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage("assets/$dayOrNight"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if(result == null){
                      witherMap = {
                      "withertime": "....",
                      "witherzone": "Pleaze choose a location 🙏",
                      "bgImage": false
                    };
                    }else{
                      witherMap = {
                      "withertime": result["withertime"],
                      "witherzone": result["witherzone"],
                      "bgImage": result["bgImage"]
                    };
                    }
                    
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 103, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                color: Color.fromARGB(111, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      witherMap["withertime"],
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      witherMap["witherzone"],
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
