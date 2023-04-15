class WitherModel {


  
  final String datetime;
  final String timezone;
  final String utc_offset;

  WitherModel({required this.utc_offset, required this.datetime, required this.timezone});

  factory WitherModel.fromjsom(data) {
    return WitherModel(datetime: data["datetime"], timezone: data["timezone"], utc_offset: data['utc_offset']);
  }

 
}
