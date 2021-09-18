import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiterabitmachinetest/error/app_error.dart';
import 'package:whiterabitmachinetest/model/employee_model.dart';
import 'package:whiterabitmachinetest/services/employee_services.dart';

class EmployeeScreenBloc
    extends Bloc<EmployeeScreenEvent, EmployeeScreenState> {
  EmployeeScreenBloc(EmployeeScreenState initialState) : super(initialState);

  @override
  EmployeeScreenState get initialState => InitialEmployeeScreenState();

  @override
  Stream<EmployeeScreenState> mapEventToState(
      EmployeeScreenEvent event,
      ) async* {
    if (event is PreformGetDataEvent) {
      yield EmployeeScreenLoadingState();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final localEmployeeList = preferences.getString('datakey') ?? '';
      print("localEmployeeList$localEmployeeList");
      if ((localEmployeeList.isEmpty)) {
        try {
          List<Employee> employeeData = await EmployeeServices().getData();
          yield GetEmployeeDataSuccessState(employee: employeeData);
        } catch (error) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          final localEmployeeList = preferences.getString('datakey') ?? '';
          print("localEmployeeList$localEmployeeList");
          if ((localEmployeeList.isEmpty)) {
            AppError _handledError = AppError(
                10, "Unable to communicate with the server\n at the moment.");
            ;
            if (error is AppError) {
              _handledError = AppError(error.code,
                  "Unable to communicate with the server\n at the moment.");
            }
            if (_handledError == null) {
              _handledError = AppError(
                  25, "Unable to fetch questions now.\nPlease try again!");
            }
            yield EmployeeScreenLoadErrorState(_handledError);
          } else {
            List<dynamic> responseObject = json.decode(localEmployeeList);
            List<Employee> employeeLists = [];
            responseObject.forEach((element) {
              final Employee employee = Employee.fromJson(element);
              employeeLists.add(employee);
            });
            yield GetEmployeeDataSuccessState(employee: employeeLists);
          }
        }
      } else {
        List<dynamic> responseObject = json.decode(localEmployeeList);
        List<Employee> employeeLists = [];
        responseObject.forEach((element) {
          final Employee employee = Employee.fromJson(element);
          employeeLists.add(employee);
        });
        yield GetEmployeeDataSuccessState(employee: employeeLists);
      }
    }
  }
}

// ---------------------------------------
// Events for this bloc
// ---------------------------------------

@immutable
abstract class EmployeeScreenEvent {}

class PreformGetDataEvent extends EmployeeScreenEvent {}
// ---------------------------------------
// States for this bloc
// ---------------------------------------

@immutable
abstract class EmployeeScreenState {}

class InitialEmployeeScreenState extends EmployeeScreenState {}

class EmployeeScreenLoadingState extends EmployeeScreenState {}

class EmployeeScreenLoadErrorState extends EmployeeScreenState {
  final AppError error;

  EmployeeScreenLoadErrorState(this.error);
}

class GetEmployeeDataSuccessState extends EmployeeScreenState {
  final List<Employee> employee;

  GetEmployeeDataSuccessState({required this.employee});
}
