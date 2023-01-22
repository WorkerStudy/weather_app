class UsersDataModel {
  bool geoPosition;
  String cityName;

  UsersDataModel({required this.geoPosition, required this.cityName});

  factory UsersDataModel.fromFile(List<int> data) {
    return UsersDataModel(
        geoPosition: data[0] == 1 ? true : false, cityName: data[1].toString());
  }
  List<dynamic> convertData() {
    // ignore: unused_local_variable
    List<dynamic> bytes = [geoPosition as dynamic, cityName as dynamic];

    return bytes;
  }
}
