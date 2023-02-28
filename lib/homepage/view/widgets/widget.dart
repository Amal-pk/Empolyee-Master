import 'package:cbo_task/edit/controller/edit_controller.dart';
import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.rowname,
    required this.textController,
    required this.keyboard,
  });
  final String rowname;
  final TextEditingController textController;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EditController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowname,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          height: 50,
          // width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                color: Colors.grey,
              )
            ],
          ),
          child: TextFormField(
            controller: textController,
            validator: (value) {
              controller.mobileValidation(value);
            },
            keyboardType: keyboard,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            // onChanged: (value) {
            //   controller.getEmployee();
            // },
          ),
        )
      ],
    );
  }
}
