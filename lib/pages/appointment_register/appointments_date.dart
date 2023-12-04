import 'package:app_medicamentos/models/appointment_model.dart';
import 'package:app_medicamentos/models/reminder_model.dart';
import 'package:app_medicamentos/utils/singleton.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../calendar/calendar.dart';
import '../records/records.dart';
import 'package:app_medicamentos/utils/buttonSheet.dart';

class AppointmentsDatePage extends StatefulWidget {
  const AppointmentsDatePage({super.key, required this.appointment});

  final Appointment appointment;

  @override
  State<StatefulWidget> createState() {
    return _AppointmentsDatePage();
  }
}

class _AppointmentsDatePage extends State <AppointmentsDatePage> {
  var appointmentDate;

  @override
  Widget build(BuildContext context) {
    Singleton singleton = Singleton();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF6F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Agendar cita',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: singleton.interfazColores.getColorDark()),
            onPressed: () {
              Navigator.pushAndRemoveUntil <dynamic>(
                context,
                MaterialPageRoute <dynamic>(
                    builder: (BuildContext context) => HomePage()
                ),
                    (route) => false,
              );
            },
          ),
          actions: const [],
          backgroundColor: const Color(0xFFF6F5F4),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.single,
                showNavigationArrow: true,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  appointmentDate = args.value;
                },
                todayHighlightColor: singleton.interfazColores.getColorDark(),
                selectionColor: singleton.interfazColores.getColorDark(),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: timeinput, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.timer), //icon of text field
                    labelText: "Hora" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  TimeOfDay? pickedTime =  await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  if(pickedTime != null ){
                    print(pickedTime.format(context));   //output 10:51 PM

                    String time = pickedTime.toString().split("(")[1];
                    time = time.split(")")[0];
                    setState(() {
                      timeinput.text = time; //set the value of text field.
                    });
                  }else{
                    print("Time is not selected");
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: Container(
                  width: 193,
                  height: 77,
                  child: ElevatedButton(
                    onPressed: () async {
                      int result = await RegisterAppointment();
                      muestraButtonSheet(context, result);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: singleton.interfazColores.getColorNeutral(),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )
                    ),
                    child: Text("Siguiente",
                      style: TextStyle(
                          fontSize: 26
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Future<int> RegisterAppointment() async {
    try{
      widget.appointment.fecha  = appointmentDate.toString().split(" ")[0] + " " + timeinput.text + ":00";

      Database database = await openDatabase(
          join(await getDatabasesPath(), 'medicamentos.db'), version: 1);

      await database.transaction((txn) async {

        var cita = widget.appointment.toMap();

        var id1 = txn.insert('Cita', cita);

        print(cita.toString());
      });

      final List<Map<String, dynamic>> maxID = await database.rawQuery(
        'SELECT MAX(id_cita) AS MaxID FROM Cita',
      );

      widget.appointment.id_cita = int.parse(maxID[0]['MaxID'].toString());
      Reminder reminder = Reminder();
      reminder.CreateAppointmentReminders(widget.appointment);

      homePageCards.clear();
      recordsPageCards.clear();
      calendarPageCards.clear();
      return 3;
  }catch(e){
      print("Error en RegisterAppointment: $e");
      return 4;
    }
  }

  TextEditingController timeinput = new TextEditingController();
}









