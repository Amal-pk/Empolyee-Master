import 'package:cbo_task/homepage/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  final TextEditingController empCode = TextEditingController();
  final TextEditingController empName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Stream<List<Employees>> readUser() {
    final details = FirebaseFirestore.instance
        .collection("Employee")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Employees.fromJson(doc.data()))
            .toList());
    // notifyListeners();
    return details;
  }

  createEmployee() async {
    final emp =
        FirebaseFirestore.instance.collection("Employee").doc(empCode.text);
    final employee = Employees(
      employeeCode: empCode.text,
      dateOfBirth: dob.text,
      address: address.text,
      employeeName: empName.text,
      mobile: mobileNo.text,
      remark: remark.text,
    );
    final details = employee.toJson();
    await emp.set(details);
    notifyListeners();
  }

  deleteEmployee() async {
    final emp =
        FirebaseFirestore.instance.collection("Employee").doc(empCode.text);

    await emp.delete();
    notifyListeners();
  }

  updateEmployee(BuildContext context) async {
    final emp =
        FirebaseFirestore.instance.collection("Employee").doc(empCode.text);
    final employee = Employees(
      employeeCode: empCode.text,
      dateOfBirth: dob.text,
      address: address.text,
      employeeName: empName.text,
      mobile: mobileNo.text,
      remark: remark.text,
    );
    final details = employee.toJson();
    await emp.update(details);
    Navigator.pop(context);
    notifyListeners();
  }

  cleartext() {
    empCode.clear();
    empName.clear();
    address.clear();
    mobileNo.clear();
    remark.clear();
    dob.clear();
  }
}
