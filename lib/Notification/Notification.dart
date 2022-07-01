// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class Push_notification extends StatefulWidget {
//   const Push_notification({Key? key}) : super(key: key);
//
//   @override
//   _Push_notificationState createState() => _Push_notificationState();
// }
//
// class _Push_notificationState extends State<Push_notification> {
//
//
//   late FlutterLocalNotificationsPlugin fltrNotification;
//   @override
//   void initState() {
//     super.initState();
//     var androidInitilize =  AndroidInitializationSettings('app_icon');
//     var iOSinitilize =  IOSInitializationSettings();
//     var initilizationsSettings =
//     new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
//     fltrNotification =  FlutterLocalNotificationsPlugin();
//     fltrNotification.initialize(initilizationsSettings,
//         onSelectNotification: notificationSelected);
//   }
//
//   Future _showNotification() async {
//     var androidDetails = AndroidNotificationDetails(
//         "Channel ID", "Desi programmer",
//         importance: Importance.max);
//     var iSODetails = new IOSNotificationDetails();
//     var generalNotificationDetails =
//     new NotificationDetails(android: androidDetails, iOS: iSODetails);
//
//     await fltrNotification.show(
//         0, "Task", "You created a Task",
//         generalNotificationDetails, payload: "Task");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Center(
//         child: RaisedButton(onPressed: (){},
//         child: Text("Flutter Notification"),),
//       ),
//
//     );
//   }
//   Future notificationSelected(String payload) async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Text("Notification Clicked"),
//       ),
//     );
//   }
//
// }
