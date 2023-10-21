import 'package:flutter/material.dart';
import 'package:my_cv/pages/contact_page.dart';
import 'package:my_cv/pages/experience_page.dart';
import 'package:my_cv/pages/home_page.dart';
import 'package:my_cv/pages/portfolio_page.dart';
import 'package:my_cv/pages/team_page.dart';
import 'package:my_cv/utils/AppColors.dart';
import 'package:my_cv/utils/AppIcons.dart';

import 'widgets/navigation_menu_widget.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: backgroundLight,
        body: Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/avtar1.png"),
                    ),
                    NavigationMenu(navHome,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 0, onClick: () {
                      _tabController.animateTo(0);
                    }),
                    NavigationMenu(navTime,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 1, onClick: () {
                      _tabController.animateTo(1);
                    }),
                    NavigationMenu(navPortfolio,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 2, onClick: () {
                      _tabController.animateTo(2);
                    }),
                    NavigationMenu(navGroup,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 3, onClick: () {
                      _tabController.animateTo(3);
                    }),
                    NavigationMenu(navContact,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 4, onClick: () {
                      _tabController.animateTo(4);
                    }),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomePage(),
                      ExperiencePage(),
                      PortfolioPage(),
                      TeamPage(),
                      ContactPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
