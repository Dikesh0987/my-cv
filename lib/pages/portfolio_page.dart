import 'package:flutter/material.dart';
import 'package:my_cv/utils/AppColors.dart';
import 'package:my_cv/utils/common_string.dart';
import 'package:my_cv/utils/text_style.dart';
import 'package:my_cv/widgets/app_image_widget.dart';

import '../main.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Portfolio", style: headerTextStyle),
            Container(
              child: Text(description, style: bodyTextStyle),
              margin: EdgeInsets.only(top: 20, bottom: 10),
            ),
            _itemWidget(width)
           
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(double width, {name, image, description}) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {
          scaffoldkey.currentState!.showBottomSheet((context) {
            return Container(
              color: backgroundLight,
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: AppImageWidget(
                      imageUrl: image,
                      fit: BoxFit.fitWidth, height: 200, width: 200,
                    ),
                    color: cardBGColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(name, style: subHeaderTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(description, style: bodyTextStyle),
                  ),
                ],
              ),
            );
          });
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: cardBGColor,
                  // image: DecorationImage(image: Image.network(image).image),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
