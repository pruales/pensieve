import 'package:flutter/material.dart';
import '../fake_data/data.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  _buildBackground(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 71, 79),
        ),
      ),
    );
  }

  _buildTitle(double height) {
    return Positioned(
      top: height * 0.05,
      left: 30,
      child: Text(
        'Concepts',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48.77,
          letterSpacing: 0.0,
          fontFamily: "Rubik",
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(width, height),
              _buildTitle(height),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: height * 0.7,
                  child: ListView.builder(
                      itemCount: title.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 35, bottom: 60),
                          child: SizedBox(
                            width: width * 0.8,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
//                                    gradient: LinearGradient(
//                                      // Where the linear gradient begins and ends
//                                      begin: Alignment.topRight,
//                                      end: Alignment.bottomLeft,
//                                      // Add one stop for each color. Stops should increase from 0 to 1
//                                      stops: [0.1, 0.5, 0.7, 0.9],
//                                      colors: [
//                                        // Colors are easy thanks to Flutter's Colors class.
//                                        Colors.indigo[800],
//                                        Colors.indigo[700],
//                                        Colors.indigo[600],
//                                        Colors.indigo[400],
//                                      ],
//                                    ),
                                      color: Color(0xFF90a4ae),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 10.0),
                                            blurRadius: 10.0)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        title[index],
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 34.54,
                                          letterSpacing: 0.25,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        descriptions[index],
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14.22,
                                          letterSpacing: 0.25,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Color(0xFF90a4ae),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF90a4ae).withOpacity(0.6),
                                offset: Offset(0.0, 2.0),
                                blurRadius: 10.0),
                          ]),
                      child: RawMaterialButton(
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.create,
                            size: 35,
                            color: Colors.black87,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),

            ],
          );
        },
      ),
//      floatingActionButton: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            width: 65,
//            height: 65,
//            decoration: BoxDecoration(
//                color: Color(0xFF90a4ae),
//                shape: BoxShape.circle,
//                boxShadow: [
//                  BoxShadow(
//                      color: Color(0xFF90a4ae).withOpacity(0.6),
//                      offset: Offset(0.0, 2.0),
//                      blurRadius: 10.0),
//                ]),
//            child: RawMaterialButton(
//                shape: CircleBorder(),
//                child: Icon(
//                  Icons.add,
//                  size: 35,
//                  color: Colors.black87,
//                ),
//                onPressed: () {}),
//          ),
//        ],
//      ),
    );
  }
}
