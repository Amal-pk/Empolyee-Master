import 'package:cbo_task/edit/edit_page.dart';
import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:cbo_task/homepage/model/model.dart';
import 'package:cbo_task/homepage/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Edit(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Employees>>(
            stream: controller.readUser(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("data");
              } else if (snapshot.hasData) {
                final details = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text(
                        "Employee Code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        "Employee Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        "Mobile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        "Remark",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ],
                    rows: details.map(rows).toList(),
                  ),
                );
                //  Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: ListView(
                //     scrollDirection: Axis.vertical,
                //     children: details.map(datarow).toList(),
                //   ),
                // );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

DataRow rows(Employees employees) => DataRow(cells: <DataCell>[
      DataCell(
        Text(
          employees.employeeCode,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DataCell(
        Text(
          employees.employeeName,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DataCell(
        Text(
          employees.address,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DataCell(
        Text(
          employees.mobile,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DataCell(
        Text(
          employees.dateOfBirth,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      DataCell(
        Text(
          employees.remark,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ]);

// Widget datarow(Employees employees) => SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 blurRadius: 2,
//                 color: Colors.black,
//               )
//             ]),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.employeeCode,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.employeeName,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.address,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.mobile,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.dateOfBirth,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 employees.remark,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
