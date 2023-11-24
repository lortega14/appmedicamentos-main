import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_medicamentos/pages/map/getApi.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(45.521563, -122.677433);

  //Guardar los puntos con las coordenadas (lat, lng)
  final List<LatLng> polyPoints = [];
  //Guardar las lineas sobre el mapa
  final Set<Polyline> polyLines = {};

  @override
  void initState() {
    getJsonData(); // Función que realiza el llamado a la api
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void actualizaCoordenadas(String lat, String lng) {
    _center = LatLng(double.parse(lat), double.parse(lng));
  }

  Future<void> getJsonData() async {
    //Llamado a la clase
    NetworkHelper networkHelper = NetworkHelper(
      startLat: 22.144596,
      startLng: -101.009064,
      endLat: 22.149730,
      endLng: -100.992221,
    );

    try {
      var data;
      //LLamado a la funcion que solicita a la api las coordenadas
      data = await networkHelper.getData();
      print(data); //json completo
      print(data['features']); // atributo 1er nivel
      print(data['features'][0]);
      print(data['features'][0]['geometry']); //atributo secundario
      print(data['features'][0]['geometry']['coordinates']); // 3er
      LineString ls = LineString(data['features'][0]['geometry']['coordinates']);

      for(int i = 0; i < ls.lineString.length; i++){
        print('${ls.lineString[i][1]}, ${ls.lineString[i][0]}');
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if(polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }

  setPolyLines() {
    setState(() {
      ///p1 --------- p2 ------- p3
      Polyline polyline = Polyline(
          polylineId: const PolylineId('polilyne'),
          color: Colors.red,
          width: 5,
          points: polyPoints
      );
      polyLines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            polylines: polyLines,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ],
      ),
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}