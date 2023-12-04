import 'package:app_medicamentos/database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../constants.dart';
import '../../utils/buttonSheet.dart';
import '../calendar/calendar.dart';
import '../home_page.dart';
import '../layout/bottom_navbar.dart';
import '../profile/profile_page.dart';
import '../records/records.dart';
import 'package:star_rating/star_rating.dart';

class feedbackPage extends StatefulWidget {
  const feedbackPage({super.key});

  @override
  State<feedbackPage> createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  int _currentIndex = 4;
  TextEditingController _feedbackController = TextEditingController();
  bool _validateFb = false;
  List<Map<String, dynamic>> _allFeedback = [];
  bool _isLoading = true;

  final int starLength = 5;
  double _rating = 0;



  void _incrementStar(){
    _rating += 1;
    if(_rating > starLength){
      _rating = starLength.toDouble();
    }
  }

  void _decrementStar(){
    _rating -= 1;
    if(_rating < 0){
      _rating = 0;
    }
  }


  void _refreshData() async{
    final feedback = await SQLHelper.getAllFeedback();
    setState(() {
      _allFeedback = feedback;
      _isLoading = false;
    });
  }

  Future<void> _addFeedback() async {
    await SQLHelper.createFeedback('Nombre', "Apellido", _feedbackController.text, _rating.floor());
    _refreshData();
  }

  Future<void> _deleteFeedback(int id) async {
    await SQLHelper.deleteFeedback(id);
  }

  @override
  void initState(){
    super.initState();
    _refreshData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text(
            'Feedback',
            style: AppStyles.encabezado1,
          ),
          actions: const [],
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
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
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Tu opinion es importante!", style: AppStyles.encabezado1),
            const SizedBox(height: 20),
            Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: _feedbackController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                    ),
                    maxLines: 5,
                    minLines: 5,
                    onChanged: (text){
                      if(text.trim().isNotEmpty){
                        _validateFb = true;
                      }
                    },
                  ),
                )
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: StarRating(
                  color: AppStyles.primaryBlue,
                  length: starLength,
                  rating: _rating,
                  between: 5,
                  starSize: 30,
                  onRaitingTap: (rating){
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  if(_validateFb == true){
                    _addFeedback();
                    _refreshData();
                  }
                  setState(() {
                    _rating = 0;
                    _feedbackController.clear();
                  });
                },
                child: const Text('Enviar', style: TextStyle(color: AppStyles.primaryBlue))
            ),
            Container(
                height: 450, // Establece la altura del Container a 450 píxeles
                child: _isLoading ?
                Center( child: CircularProgressIndicator()) :
                ListView.builder(
                  itemCount: _allFeedback.length,
                  itemBuilder: (context, index) => Card(
                      elevation: 5,
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_allFeedback[index]['name'] + ' ' + _allFeedback[index]['lastname'], textAlign: TextAlign.left),
                            SizedBox(height: 10),
                            Text(_allFeedback[index]['fb'], textAlign: TextAlign.left),
                            SizedBox(height: 10),
                            StarRating(
                              length: 5,
                              rating: (_allFeedback[index]['rate']).toDouble(),
                            ),
                          ],
                        ),
                      )
                  ),
                )
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        child: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch(index){
              case 0:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const HomePage(),
                  ),
                      (route) => false,
                );
                break;
              case 1:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const CalendarPage(),
                  ),
                      (route) => false,
                );
                break;
              case 2:
              //muestraButtonSheet();
                break;
              case 3:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const RecordsPage(),
                  ),
                      (route) => false,
                );
                break;
            }
          },
        ),
      ),
    );
  }
}