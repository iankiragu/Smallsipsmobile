import 'package:flutter/material.dart';

class Settingsscreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    final deviceheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("System Information"),
      ),
      body: Container(
          height: deviceheight,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                    title: Text("Messaging"),
                    subtitle: Text("Interact with doctors at Smallsips.azurewebsites.net"),
                    leading: Icon(
                      Icons.message,
                      color: Theme.of(context).primaryColor,
                    ),isThreeLine: true,),
              ),
               SizedBox(height: 20),
               Card(
                elevation: 10,
                child: ListTile(
                    title: Text("Contact Us"),
                    subtitle: Text("Have a Comment or Complaint? Contact Admin at Smallsip.sazurewebsites,net"),
                    leading: Icon(
                      Icons.help,
                      color: Theme.of(context).primaryColor,
                    ),isThreeLine: true,),
              ),
            ],
          )),
    );
  }
}
