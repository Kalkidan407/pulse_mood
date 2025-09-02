// ElevatedButton(
//   onPressed: () => Get.to(() => ScannerScreen()),
//   style: ButtonStyle(
//     backgroundColor: WidgetStateProperty.all(Colors.amber),
//     elevation: WidgetStateProperty.all(8.0),
//     shadowColor: WidgetStateProperty.all(Colors.black),
//     shape: WidgetStateProperty.all(
//       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     ),
//     padding: WidgetStateProperty.all(
//       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     ),
//   ),
//   child: const Text('Scan'),
// );


// style: ButtonStyle(
  // backgroundColor: WidgetStateProperty.resolveWith((states) {
  //   if (states.contains(WidgetState.disabled)) return Colors.grey;
  //   if (states.contains(WidgetState.pressed))  return Colors.amber.shade700;
  //   return Colors.amber;
  // }),
  // elevation: WidgetStateProperty.resolveWith((states) {
  //   return states.contains(WidgetState.pressed) ? 2.0 : 8.0;
  // }),
// ),
