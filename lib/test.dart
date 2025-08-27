// class _ScannerScreenState extends State<ScannerScreen> {
//   int bpm = 0;
//   bool isScanning = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Scanner")),
//       body: Center(
//         child: isScanning
//             ? HeartBPMDialog(
//                 context: context,
//                 onBPM: (value) {
//                   setState(() => bpm = value);

//                   if (bpm > 0) {
//                     setState(() => isScanning = false); // stop showing dialog
//                     Get.to(() => ResultScreen(bpm: bpm));
//                   }
//                 },s
//               )
//             : Container(), // empty container when stopped
//       ),
//     );
//   }
// }
// // 