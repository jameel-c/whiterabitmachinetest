import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiterabitmachinetest/model/employee_model.dart';

class Global{
  static Employee sharedEmployee = Employee();
  static void savData() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String? dataJson = preferences.getString("data");
        sharedEmployee = Employee.fromJson(json.decode(dataJson!));

  }

}