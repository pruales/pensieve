import 'package:flutter/material.dart';
import '../fake_data/data.dart';

//import '../widgets/addthoughtmodal_old.dart';
import '../widgets/addthoughtmodal.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final AddThoughtModal addThoughtModal = AddThoughtModal();

  _addThought(String thought) {
    print(thought);
  }

  _buildBackground(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFFAFBFC),
        ),
      ),
    );
  }

  _buildTitle(double height, double notchHeight) {
    print(notchHeight);
    return Positioned(
      top: (height * 0.01) + notchHeight,
      left: 30,
      right: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Concepts',
            style: TextStyle(
              color: Color(0xFF000000).withOpacity(0.77),
              fontSize: 48.77,
              letterSpacing: 0.0,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
                color: Color(0xFFffffff),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF90a4ae).withOpacity(0.6),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 10.0),
                ]),
            child: RawMaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                shape: StadiumBorder(),
                child: Icon(
                  Icons.settings,
                  size: 16,
                ),
                onPressed: () {
                  print('settings');
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;
          var notchHeight = MediaQuery.of(context).padding.top;
          print(constraints);
          print(MediaQuery.of(context).size.height);
          //TODO: use mediaquery padding to avoid notches
          print(MediaQuery.of(context).padding);
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(width, height),
              _buildTitle(height, notchHeight),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: (height - notchHeight) * 0.7,
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
                                      color: Color(0xFF83aaa6),
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
                                          color: Color(0xFF000000)
                                              .withOpacity(0.77),
                                          fontSize: 34.54,
                                          letterSpacing: 0.25,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        descriptions[index],
                                        style: TextStyle(
                                          color: Color(0xFF000000)
                                              .withOpacity(0.77),
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
                      width: 208,
                      height: 58,
                      decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF90a4ae).withOpacity(0.6),
                                offset: Offset(0.0, 2.0),
                                blurRadius: 10.0),
                          ]),
                      child: RawMaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Add Thought",
                                style: TextStyle(
                                  color: Color(0xFF000000).withOpacity(0.77),
                                  fontSize: 17,
                                  letterSpacing: 0.25,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            print('adding thought');
                            addThoughtModal.mainBottomSheet(context);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
