import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiterabitmachinetest/model/employee_model.dart';
import 'package:whiterabitmachinetest/screens/employee_bloc.dart';
import 'package:whiterabitmachinetest/screens/employee_details.dart';
import 'package:whiterabitmachinetest/widgets/shimmer_loader.dart';
import 'package:whiterabitmachinetest/widgets/widget_error.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  EmployeeScreenBloc _bloc = EmployeeScreenBloc(InitialEmployeeScreenState());
  List<Employee> employeelist = [];
  List<Employee> searchemployeelist = [];

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(PreformGetDataEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Employee List",style: TextStyle(color: Colors.black),)
        ),
        body: BlocConsumer<EmployeeScreenBloc, EmployeeScreenState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is GetEmployeeDataSuccessState) {
                employeelist = state.employee;

              }
            },
            builder: (BuildContext context, EmployeeScreenState state) {
              if (state is GetEmployeeDataSuccessState) {
                if(state.employee.isEmpty) {
                  return WidgetError(
                    errorMessage: "No Data found",
                    errorImageUrl: "assets/images/something_went.png",
                    onClick: () {
                      _bloc.add(PreformGetDataEvent());
                    },
                  );
                }
                return Center(
                  child: Container(
                    padding: EdgeInsets.only(left:4),
                    //margin: EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 5, horizontal: SizeConfig.widthMultiplier * 5),
                    child:Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.white,
                              width: 280,
                              child: TextField(
                                textAlign: TextAlign.left,
                                controller: searchController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'search using full name',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  // fillColor: colorSearchBg,
                                ),
                              ),
                            ),
                            IconButton(
                              tooltip: "Search",
                              icon: Icon(Icons.search),

                              onPressed: (){
                                searchemployeelist.clear();
                                  for(int j=0;j<employeelist.length;j++){
                                    if(searchController.text.trim() == employeelist[j].name){
                                      searchemployeelist.add(employeelist[j]);
                                      print("found");

                                    }
                                  }
                                  print(searchemployeelist);
                                  if(searchemployeelist.length > 0){
                                    showAlertDialog(context, 'Employee  ${searchController.text} worked in this organisation', "Succes" , "Ok");

                                  }else{
                                    showAlertDialog(context, 'Employee  not worked in this organisation', "Succes" , "Ok");

                                  }
                              },
                            )
                          ],
                        ),
                        Divider(),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: employeelist.length,
                              itemBuilder: (BuildContext context,int index){

                                return Column(
                                  children: [
                                    Container(
                                     // color: Colors.red,
                                      height:80,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EmployeeDetails(employee: employeelist[index],)),
                                          );
                                        },
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                            NetworkImage(employeelist[index].profileImage ?? "https://www.w3schools.com/howto/img_avatar.png"),
                                          ),
                                          title: Text(employeelist[index].name ?? ""),
                                          subtitle:Text(employeelist[index].email ?? ""),
                                        ),
                                      ),


                                    ),
                                    Divider()
                                  ],
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is EmployeeScreenLoadingState || state is InitialEmployeeScreenState) {

                  return ShimmerLoader();

              } else if (state is EmployeeScreenLoadErrorState) {
                return WidgetError(
                  errorMessage: "Something went wrong",
                  errorImageUrl: "assets/images/something_went.png",
                  onClick: () {
                    _bloc.add(PreformGetDataEvent());
                  },
                );
              }
              return WidgetError(
                errorMessage: "Something went wrong",
                errorImageUrl: "assets/images/something_went.png",
                onClick: () {

                 _bloc.add(PreformGetDataEvent());
                },
              );
            }));
  }
  showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle) {
    // set up the buttons
    // Widget cancelButton = FlatButton(
    //   child: Text(buttonCancelTitle),
    //   onPressed: () {},
    // );
    Widget continueButton = FlatButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
