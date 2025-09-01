// void showCustomBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // makes it possible to use full height if needed
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) {
//       return DraggableScrollableSheet(
//         initialChildSize: 0.4, // 40% of screen height
//         minChildSize: 0.2,     // minimum 20%
//         maxChildSize: 0.9,     // maximum 90%
//         expand: false,
//         builder: (context, scrollController) {
//           return Container(
//             padding: EdgeInsets.all(16),
//             child: ListView(
//               controller: scrollController,
//               children: [
//                 Text(
//                   "This is a custom bottom sheet",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Text("You can put any widget here."),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }

//  actions: [
//           IconButton(onPressed: () {
//             themeServices.switchTheme();
//           } 
//           , icon: Icon(Icons.brightness_6))
//         ],
