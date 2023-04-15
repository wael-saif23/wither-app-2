import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:world_time_app/models/wither_models.dart';

class WitherService {
final String link;
  final String countryName;
  final String flag;


  late bool bgImage;
  late String witherTime;
  late String timezone;

  WitherService({required this.link,required this.countryName,required this.flag});

  getWither() async {
    Uri url = Uri.parse("http://worldtimeapi.org/api/timezone/$link");

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WitherModel wither = WitherModel.fromjsom(data);

    int utcOffset = int.parse(wither.utc_offset.substring(0, 3));
     witherTime = DateFormat("hh:mm a").format(
        DateTime.parse(wither.datetime).add(Duration(hours: utcOffset - 1)));
    DateTime dateTime =
        DateTime.parse(wither.datetime).add(Duration(hours: utcOffset - 1));
    if (dateTime.hour > 5 && dateTime.hour < 18) {
      bgImage = true;
    } else {
      bgImage = false;
    }

     timezone = wither.timezone;
    
    
  }
}
