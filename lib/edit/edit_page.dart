import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:cbo_task/homepage/model/model.dart';
import 'package:cbo_task/homepage/view/widgets/button.dart';
import 'package:cbo_task/homepage/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

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
                  MyRow(
                    rowname: 'Employee Name',
                    textController: controller.empName,
                    keyboard: TextInputType.name,
                  ),
                  MyRow(
                    rowname: 'Address 1',
                    textController: controller.address,
                    keyboard: TextInputType.name,
                  ),
                  MyRow(
                    rowname: 'Mobile No.',
                    textController: controller.mobileNo,
                    keyboard: TextInputType.phone,
                  ),
                  MyRow(
                    rowname: 'Date of Birth',
                    textController: controller.dob,
                    keyboard: TextInputType.datetime,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateEmployee(context);
                          controller.cleartext();
                        },
                        child: const AddAndDeleteButton(
                          buttonName: "Edit",
                          clr: Colors.green,
                        ),
                      ),
                      // AddAndDeleteButton(buttonName: "", clr: clr)
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
