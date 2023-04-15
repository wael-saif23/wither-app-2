// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:world_time_app/models/wither_models.dart';
import 'package:world_time_app/services/wither_service.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  sendData() async {
    WitherService service = WitherService(link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png');

     await service.getWither();

    
      
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "withertime": service.witherTime,
      "witherzone": service.timezone,
      "bgImage": service.bgImage
    });
  }

  @override
  void initState() {
    sendData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(146, 12, 16, 49),
              size: 160.0,
            )
          ],
        ),
      ),
    );
  }
}
