import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:cbo_task/homepage/view/widgets/button.dart';
import 'package:cbo_task/homepage/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Enter Employee Details"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRow(
                    rowname: 'Employee Code',
                    textController: controller.empCode,
                    keyboard: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRow(
                    rowname: 'Employee Name',
                    textController: controller.empName,
                    keyboard: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRow(
                    rowname: 'Address 1',
                    textController: controller.address,
                    keyboard: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRow(
                    rowname: 'Mobile No.',
                    textController: controller.mobileNo,
                    keyboard: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRow(
                    rowname: 'Date of Birth',
                    textController: controller.dob,
                    keyboard: TextInputType.datetime,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRow(
                    rowname: 'Remarks',
                    textController: controller.remark,
                    keyboard: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.createEmployee();
                          controller.cleartext();
                        },
                        child: const AddAndDeleteButton(
                          buttonName: "ADD",
                          clr: Colors.green,
                        ),
                      ),
                      // AddAndDeleteButton(buttonName: "", clr: clr)
                      InkWell(
                        onTap: () {
                          controller.deleteEmployee();
                          controller.empCode.clear();
                        },
                        child: const AddAndDeleteButton(
                          buttonName: "DELETE",
                          clr: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// DataTable(
//                             dividerThickness: 2,
//                             columns: const [
//                               DataColumn(
//                                 label: Text("Code"),
//                               ),
//                               DataColumn(
//                                 label: Text("Name"),
//                               ),
//                               DataColumn(
//                                 label: Text("Address"),
//                               ),
//                               DataColumn(
//                                 label: Text("Mobile"),
//                               ),
//                               DataColumn(
//                                 label: Expanded(
//                                   child: Text("Date of Birth"),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text("Remark"),
//                               ),
//                             ],
//                             rows: details.map(datarow).toList(),
//                           );