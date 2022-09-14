import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final imageUrl =
      "https://media-exp1.licdn.com/dms/image/C4D03AQGB9A90nbs8pw/profile-displayphoto-shrink_800_800/0/1640072596858?e=1667433600&v=beta&t=v5UwAu9OdMngeWC2w8Qj0zVPgXJkNmDr0TXnLerSSOQ";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              currentAccountPicture:
              CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
              accountName: Text("Jai Motwani"),
              accountEmail: Text("esehi@esehi.com"),
            ),
          ),
          const ListTile(minVerticalPadding:10,leading: Icon(Icons.home_outlined,size:30,color: Colors.white,),title:Text("Home",style: TextStyle(color: Colors.white,fontSize: 20),) ,)
          ,SizedBox(width: 1,height: 1,),const ListTile(leading: Icon(Icons.email_outlined,size:30,color: Colors.white,),title:Text("Email",style: TextStyle(color: Colors.white,fontSize: 20),) ,)
          ,SizedBox(width: 1,height: 1,),const ListTile(leading: Icon(Icons.account_circle_outlined,size:30,color: Colors.white,),title:Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20),) ,)
        ],

      ),
    );
  }
}
