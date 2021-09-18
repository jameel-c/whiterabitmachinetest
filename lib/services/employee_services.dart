import 'dart:convert';


import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiterabitmachinetest/error/app_error.dart';
import 'package:whiterabitmachinetest/model/employee_model.dart';
import 'package:whiterabitmachinetest/services/api_services.dart';



class EmployeeServices extends ApiService {


  Future<List<Employee>> getData() async {
    var headers = Map<String, String>();
    var params = Map<String, String>();
    headers['Content-Type'] = 'application/json';

    Future<ParsedResponse> future = get(
      "http://www.mocky.io/v2/5d565297300000680030a986",
      params: params,
      headers: headers,
    );

    return future.then((ParsedResponse res) async {
      if (res.isOk()) {
        try {
          String data = res.response;
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('datakey', data);
          List<dynamic> responseObject = json.decode(res.response);
          List<Employee> employeeLists = [];
          responseObject.forEach((element) {
            final Employee employee = Employee.fromJson(element);
            employeeLists.add(employee);
          });
          return employeeLists;
        } catch (e) {
          print(e.toString());
          throw AppError.serverError;
        }
      } else {
        throw AppError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }

}
