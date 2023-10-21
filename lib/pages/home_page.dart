import 'package:flutter/material.dart';
import 'package:my_cv/utils/common_string.dart';
import 'package:my_cv/utils/text_style.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text("snapshot.data.toString()", style: headerTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child:   Text("snapshot.data.toString()", style: headerTextStyle),
          ),
            Text("snapshot.data.toString()", style: headerTextStyle),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(title2, style: headerTextStyle)),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              description,
              style: bodyTextStyle,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(title3, style: headerTextStyle)),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Text(
              description,
              style: bodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
