
import 'package:flutter/material.dart';
import 'package:health_care/helper/common_widgets/commonwidgets.dart';
import 'package:health_care/helper/constant.dart';
import 'package:health_care/screens/user_screens/DoctorList.dart';
import 'package:health_care/screens/user_screens/FindDoctorScreen.dart';
import 'package:loading_animations/loading_animations.dart';
import 'Settings.dart';
import 'AppointmentList.dart';

import 'FindHospitalScreen.dart';
import 'finder_name.dart';

import 'package:health_care/widgets/tabbar/tabbar.dart';
import 'package:health_care/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(new DashboardScreen());

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String name = " ";
  String useremail = " ";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
//    var user = jsonDecode(localStorage.getString('user'));
    setState(() {
      name = localStorage.getString('first_name');
      print(name);
      useremail = localStorage.getString('email');
    });
  }

//  DashboardScreen( {this.users} );

  List listData = [
    {
      "title": "Find Doctor",
      "icon": Icon(
        Icons.person,
        color: Colors.white,
        size: 40,
      ),
      "isSelect": true
    },
    {
      "title": "Find Hospital",
      "icon": Icon(
        Icons.business,
        color: Colors.white,
        size: 40,
      ),
      "isSelect": false
    },
    {
      "title": "App Info",
      "icon": Icon(
        Icons.queue,
        color: Colors.white,
        size: 40,
      ),
      "isSelect": false
    },
//        {"title":"dashbPriceServices","icon":Icon(Icons.insert_invitation,color:Colors.white,size: 40,),"availability":"priceServicesAvaliability","isSelect":false},
    {
      "title": "Health Consult",
      "icon": Icon(
        Icons.search,
        color: Colors.white,
        size: 40,
      ),
      "isSelect": false
    },
//        {"title":"comingSoon","icon":Icon(Icons.settings,color:Colors.white,size: 40,),"availability":"newFunctionality","isSelect":false},
  ];

  _setMainInformationView() {
    return Container(
      // height: 185,
      padding: EdgeInsets.all(20),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              setCommonText(
                  AppTitle.dashbHello, Colors.black, 25.0, FontWeight.w500, 1),
              setCommonText(" " + name + " ," ?? " ", Colors.black, 25.0,
                  FontWeight.w500, 1),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          setCommonText(
              AppTitle.dashboard_title, Colors.grey, 25.0, FontWeight.w500, 2),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _setGridViewListing() {
    return Container(
      height: 520,
      // color: Colors.yellow,
      padding: EdgeInsets.all(20),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: (3 / 2.5),
        children: List<Widget>.generate(listData.length, (index) {
          return GridTile(
            child: InkWell(
              onTap: () {
                setState(() {
                  for (var i = 0; i < listData.length; i++) {
                    listData[i]['isSelect'] = false;
                  }
                  listData[index]['isSelect'] = true;
                });
                // FindDoctorScreen
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed(DoctorList.routeName);
                    break;
                  case 1:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FindHospitalScreen()));
                    break;
                  case 2:
                    Navigator.of(context).pushNamed(Settingsscreen.routeName);
                    break;
                  case 3:
                    Navigator.of(context)
                        .pushNamed(FindDoctorScreen.routeName);
                    break;
                  default:
                }
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Material(
                    color: (listData[index]['isSelect'])
                        ? AppColor.themeColor
                        : Colors.black54,
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          listData[index]['icon'],
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              setCommonText(listData[index]['title'],
                                  Colors.white, 16.0, FontWeight.w700, 2),
//                             SizedBox(height: 3,),
//                             setCommonText(listData[index]['availability'], Colors.white,12.0, FontWeight.w500,2),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    final user = Provider.of<User>(context);
//    print(user.email);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: setHeaderTitle(AppTitle.appTitle, Colors.white),
        backgroundColor: AppColor.themeColor,
        elevation: 1.0,
//        actions: setCommonCartNitificationView(context),
      ),
      drawer: DrawerWidget(),
      //bottomNavigationBar: TabBarScreen(),
      body: name == null
          ? Center(child: LoadingJumpingLine.square(backgroundColor: Colors.red,))
      :
      Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[_setMainInformationView(), _setGridViewListing()],
        ),
      ),
    );
  }
  //This is for localization

}
