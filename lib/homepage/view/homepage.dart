import 'package:cbo_task/homepage/controller/animation_controller.dart';
import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:cbo_task/homepage/view/widgets/button.dart';
import 'package:cbo_task/homepage/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final controller = Provider.of<HomePageController>(context);
    final animationController = Provider.of<AnimateController>(context);
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
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<AnimateController>(
                            builder: (context, value, _) {
                          return InkWell(
                            onTap: () {
                              animationController.isAdd();
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: animationController.add
                                    ? Colors.green
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Consumer<AnimateController>(
                    builder: (context, value, _) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        height: animationController.add ? high / 1.42 : 0,
                        alignment: animationController.add
                            ? Alignment.centerRight
                            : AlignmentDirectional.center,
                        curve: Curves.fastOutSlowIn,
                        child: animationController.add
                            ? Column(
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
                                  InkWell(
                                    onTap: () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.createEmployee();
                                        controller.cleartext();
                                      }
                                    },
                                    child: const AddAndDeleteButton(
                                      buttonName: "ADD",
                                      clr: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            : null,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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