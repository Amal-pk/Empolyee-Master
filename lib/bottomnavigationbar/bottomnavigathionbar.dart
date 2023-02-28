// import 'package:cbo_task/bottomnavigationbar/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BottomBar extends StatelessWidget {
//   const BottomBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<BottomController>(context);
//     int currentScreenIndex = controller.currentIndexSearch();
//     return Scaffold(
//       body: controller.screens[currentScreenIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.purple,
//         selectedItemColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         // showSelectedLabels: false,
//         elevation: 0,
//         currentIndex: currentScreenIndex,
//         onTap: (value) => controller.currentIndexResult(value),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               (currentScreenIndex == 0)
//                   ? Icons.home_rounded
//                   : Icons.home_outlined,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               (currentScreenIndex == 1)
//                   ? Icons.person
//                   : Icons.person_4_outlined,
//             ),
//             label: 'ADD',
//           ),
//         ],
//       ),
//     );
//   }
// }
