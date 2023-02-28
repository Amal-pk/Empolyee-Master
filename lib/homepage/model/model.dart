class Employees {
    Employees({
        required this.employeeCode,
        required this.dateOfBirth,
        required this.address,
        required this.employeeName,
        required this.mobile,
        required this.remark,
    });

    String employeeCode;
    String dateOfBirth;
    String address;
    String employeeName;
    String mobile;
    String remark;

    factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        employeeCode: json["employeeCode"],
        dateOfBirth: json["date of birth"],
        address: json["address"],
        employeeName: json["employeeName"],
        mobile: json["mobile"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "employeeCode": employeeCode,
        "date of birth": dateOfBirth,
        "address": address,
        "employeeName": employeeName,
        "mobile": mobile,
        "remark": remark,
    };
}
