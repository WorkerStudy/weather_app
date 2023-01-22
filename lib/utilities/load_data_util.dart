import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:weather_app/models/users_data_model.dart';

class LoadDataUtil {
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = directory.path;
    var file = File('$path/userInfo.inf');
    return file;
  }

  void saveDataUser(UsersDataModel data) async {
    var file = await _getFile();
    var streamWrite = file.openWrite();

    streamWrite.writeAll(data.convertData());
    streamWrite.close();
  }

  Future<UsersDataModel> loadDataUser() async {
    var file = await _getFile();
    var streamRead = file.openRead();

    List<List<int>> Listdata = await streamRead.toList();
    //String text = double.parse(Listdata[0][1]);
    // print(Listdata toString());
    return UsersDataModel.fromFile(Listdata[0]);
  }
}
