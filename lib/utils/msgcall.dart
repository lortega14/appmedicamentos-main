import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/* //////////////////////Notification/////////////////////// */
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:app_medicamentos/pages/profile/profile_page.dart';


class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}
/* //////////////////////Initialitation Notification/////////////////////// */
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('icon_mednotification');

  const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            '',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF09184D)),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => ProfilePage()
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: Color(0xFFF6F5F4),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _textMe();
                });
              },
              icon: Icon(
                Icons.message_rounded, color: Color(0xFFFCAC00), size: 50,),
            ),
            const SizedBox(height: 20,),

            IconButton(
              onPressed: () {
                setState(() {
                  _callMe();
                });
              },
              icon: Icon(Icons.call, color: Color(0xFF035600), size: 50,),
            ),
            const SizedBox(height: 20,),
            IconButton(//Notificaciones
              onPressed: () {
                setState(() {
                  mostrarNotificacion(1);
                });
              },
              icon: Icon(Icons.access_alarm_rounded, color: Colors.blue, size: 50,),
            ),
            const SizedBox(height: 20,),
            IconButton(//Notificaciones
              onPressed: () {
                setState(() {
                  mostrarNotificacion(2);
                });
              },
              icon: Icon(Icons.access_alarm, color: Colors.pinkAccent, size: 50,),
            ),
            IconButton(//Notificaciones
              onPressed: () {
                setState(() {
                  mostrarNotificacion(3);
                });
              },
              icon: Icon(Icons.calendar_month, color: Colors.pinkAccent, size: 50,),
            ),
          ],
        ),
      ),
    );
  }
int checkNotification = 0;
  Future<void> mostrarNotificacion(checkNotification) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your_channel_id', 'your_channel_ame');

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    if(checkNotification == 1)
        await flutterLocalNotificationsPlugin.show(1, 'RECORDATORIO DE MEDICAMENTOS',
        'No olvides que han pasado 5 minutos desde que debias tomar tus medicamentos',
        notificationDetails);
    if(checkNotification == 2)
      await flutterLocalNotificationsPlugin.show(1, 'RECORDATORIO DE MEDICAMENTOS',
          'No olvides que es la hora de tomar tus medicamentos',
          notificationDetails);
    if(checkNotification == 3)
        await flutterLocalNotificationsPlugin.show(1, 'CITA MEDICA PROGRAMADA PARA MAÑANA ',
            'Recuerda que dentro de 24 horas tienes una cita medica', notificationDetails);

  }
  _callMe() async {
    //$telefono variable
    launch('tel: 4448284676');
  }


  _textMe() async {
    //%20 es el espacio
    //Lamado a la    Parámetros a enviar
    //funcion
    const uri = 'sms:+4448284676?body=%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    }
    else {
      const uri = 'sms:0039-222-060-888?body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

}
