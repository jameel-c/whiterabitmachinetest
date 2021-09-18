import 'package:flutter/material.dart';
import 'package:whiterabitmachinetest/model/employee_model.dart';

class EmployeeDetails extends StatefulWidget {
  final Employee employee;
  const EmployeeDetails({Key? key, required this.employee}) : super(key: key);

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Employee Details",style: TextStyle(color: Colors.black),),
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage:
                  NetworkImage(widget.employee.profileImage ??
                      "https://www.w3schools.com/howto/img_avatar.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.employee.name ?? "name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Text(widget.employee.username ?? "username"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20,),
                        Text(widget.employee.email ?? "phone"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 20,),
                        Text(widget.employee.phone ?? "9876543211"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.link),
                        SizedBox(width: 20,),
                        Text(widget.employee.website ?? "www.google.com"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.house),
                        SizedBox(width: 20,),
                        // Text(widget.employee.address?.city ?? "address"),
                        Text('${widget.employee.address?.city} \n'
                            '${widget.employee.address?.street} \n'
                            '${widget.employee.address?.zipcode} '
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_balance_outlined),
                        SizedBox(width: 20,),
                        // Text(widget.employee.company?.name ?? "address"),
                        Text('${widget.employee.company?.name} \n'
                            '${widget.employee.company?.bs} \n'
                            '${widget.employee.company?.catchPhrase} ' ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
