// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/wither_models.dart';
import '../services/wither_service.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WitherService> witherService = [
    WitherService(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    WitherService(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    WitherService(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    WitherService(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    WitherService(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    WitherService(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: witherService.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () async {
                WitherService service = witherService[index];

     await service.getWither();

    
      
    Navigator.pop(context,  {
      "withertime": service.witherTime,
      "witherzone": service.timezone,
      "bgImage": service.bgImage
    });
              },
              title: Text(
                witherService[index].countryName,
                style: TextStyle(fontSize: 22),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${witherService[index].flag}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
