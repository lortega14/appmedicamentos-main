import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_medicamentos/pages/home_page.dart';
import 'package:app_medicamentos/utils/singleton.dart';
import 'package:app_medicamentos/pages/profile/edit_profile.dart';
import 'package:app_medicamentos/pages/calendar/calendar.dart';
import 'package:app_medicamentos/pages/records/records.dart';
import 'package:app_medicamentos/pages/layout/bottom_navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as PATH;
import 'package:app_medicamentos/utils/msgcall.dart';
import 'package:page_transition/page_transition.dart';
import 'package:app_medicamentos/constants.dart';
import '../../utils/colorSheet.dart';
import '../feedback/feedback_page.dart';
import 'package:app_medicamentos/pages/map/map_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  Singleton singleton = Singleton();
  XFile ? _selectedImage;

  int _currentIndex = 4;
  List<String> user = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    Singleton singleton = Singleton();
    select(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyles.primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Perfil',
            style: AppStyles.encabezado1,
          ),
          actions: const [],
          backgroundColor: singleton.interfazColores.light,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: profilePicture(),
              ),
              SizedBox(height: 20),
              Text(
                'Nombre: ' +
                    nombreController.text +
                    ' ' +
                    apellidoPController.text +
                    ' ' +
                    apellidoMController.text,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Fecha de nacimiento: ' + fechaNacController.text,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Dirección: ' +
                    calleController.text +
                    ' ' +
                    numExteriorController.text +
                    ', ' +
                    coloniaController.text,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Cuidador: ' + cuidadorController.text,
                style:  const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const EditProfile(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Edit",
                    backgroundColor: singleton.interfazColores.dark,
                    child: const Icon(Icons.edit),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const Message(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Message",
                    backgroundColor: singleton.interfazColores.dark,
                    child: const Icon(Icons.message),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      muestraColorSheet(context);
                    },
                    heroTag: "Color",
                    backgroundColor: singleton.interfazColores.dark,
                    child: const Icon(Icons.color_lens),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const feedbackPage(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Feedback",
                    backgroundColor: singleton.interfazColores.dark,
                    child: const Icon(Icons.feedback),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const Mapa(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Feedback",
                    backgroundColor: singleton.interfazColores.dark,
                    child: const Icon(Icons.map),
                  )
                ],
              ),
              /*
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 50),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const EditProfile(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Edit",
                    backgroundColor: singleton.interfazColores.dark,
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 50),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.small(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const Message(),
                        ),
                            (route) => false,
                      );
                    },
                    heroTag: "Message",
                    backgroundColor: singleton.interfazColores.dark,
                    child: Icon(Icons.message),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 50),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.small(
                    onPressed: () {
                      muestraColorSheet(context);
                    },
                    heroTag: "Color",
                    backgroundColor: singleton.interfazColores.dark,
                    child: Icon(Icons.color_lens),
                  ),
                ),
              ),
              */
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const HomePage(),
                ),
                    (route) => false,
              );
            } else if (index == 1) {
              Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const CalendarPage(),
                ),
                    (route) => false,
              );
            } else if (index == 2) {
              //muestraButtonSheet();
            } else if (index == 3) {
              Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const RecordsPage(),
                ),
                    (route) => false,
              );
            } else if (index == 4) {
              // Pagina actual, no necesita navegacion
            }
          },
        ),
      ),
    );
  }

  Future<void> select(var context) async {
    if (nombreController.text == "" &&
        apellidoPController.text == "" &&
        apellidoMController.text == "" &&
        fechaNacController.text == "" &&
        calleController.text == "" &&
        coloniaController.text == "" &&
        numExteriorController.text == "" &&
        cuidadorController.text == "") {
      Database database = await openDatabase(
        PATH.join(await getDatabasesPath(), 'medicamentos.db'),
        version: 1,
      );

      final List<Map<String, dynamic>> map1 = await database.rawQuery(
        'SELECT * FROM Usuario LIMIT 1',
      );
      final List<Map<String, dynamic>> map2 = await database.rawQuery(
        'SELECT * FROM Padecimiento LIMIT 1',
      );

      print("map1: " + map1.length.toString());
      print("map2: " + map2.length.toString());
      print(map1[0]['nombre'].toString());

      nombreController.text = map1[0]['nombre'].toString();
      apellidoPController.text = map1[0]['apellidoP'].toString();
      apellidoMController.text = map1[0]['apellidoM'].toString();
      fechaNacController.text = map1[0]['fechaNac'].toString();
      calleController.text = map1[0]['calle'].toString();
      coloniaController.text = map1[0]['club'].toString();
      numExteriorController.text = map1[0]['numero_exterior'].toString();
      cuidadorController.text =
          map1[0]['cuidador_nombre'].toString() +
              "\n" +
              map1[0]['cuidador_telefono'].toString();

      print(cuidadorController.text);

      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ProfilePage(),
        ),
            (route) => false,
      );
    }
  }

  Widget profilePicture(){
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: singleton.returnImage() == null ? null : FileImage(File(singleton.returnImage()!.path)),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet())
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 28.0,
              )
          ),
        )
      ],
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),
      child: Column(
        children: [
          const Text("Elige una foto de perfil:", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  _pickImageFromCamera();
                },
                child: Icon(Icons.camera),
              ),
              TextButton(
                  onPressed: (){
                    _pickImageFromGallery();
                  },
                  child: Icon(Icons.photo)
              )
            ],
          )
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async{
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    singleton.saveImage(_selectedImage);
    setState(() {

    });
  }


  Future _pickImageFromCamera() async{
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    singleton.saveImage(_selectedImage);
    setState(() {

    });
  }
}

TextEditingController nombreController = TextEditingController();
TextEditingController apellidoPController = TextEditingController();
TextEditingController apellidoMController = TextEditingController();
TextEditingController fechaNacController = TextEditingController();
TextEditingController calleController = TextEditingController();
TextEditingController coloniaController = TextEditingController();
TextEditingController numExteriorController = TextEditingController();
TextEditingController cuidadorController = TextEditingController();
