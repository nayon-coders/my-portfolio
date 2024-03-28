import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/admin/dashboard/admin-dashboard.dart';
import 'package:portfolio/presentation/widgets/title_text.dart';
import 'dart:html' as html;
import '../controller.dart';
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

   final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   var _projectLength = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("$_projectLength",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:30,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Total Post",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("20",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:30,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Total Message",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            TitleText(text: "Recent Portfolio",),
            SizedBox(height: 10,),
            StreamBuilder(
              stream: _firestore.collection("portfolio").snapshots(),
              builder: (context, snapshot) {

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasData) {
                  var data = snapshot.data?.docs;
                  _projectLength = snapshot.data!.docs!.length;
                  return SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 20),
                          child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "${data[index]["image"]}"),
                              ),
                              title: Text("${data[index]["projectName"]}"),
                              subtitle: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text("Project Complete: ${data[index]["completionDate"]} || Status: ${data[index]["status"]== 1 ? "Active": "Deactive" },"),
                                    SizedBox(width: 10,),
                                    IconButton(
                                      onPressed: ()async{
                                        AdminViewController.launchUrl(data[index]["googlePlayLink"]); //launchUrl
                                      },
                                      icon: Icon(Icons.g_mobiledata),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        AdminViewController.launchUrl(data[index]["appleStoreLink"]); //launchUrl
                                      },
                                      icon: Icon(Icons.apple),
                                    ),
                                    data[index]["videoLink"]!.isNotEmpty ? IconButton(
                                      onPressed: (){
                                        AdminViewController.launchUrl(data[index]["videoLink"]); //launchUrl
                                      },
                                      icon: Icon(Icons.video_camera_back),
                                    ) : Center()
                                  ],
                                ),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async{
                                        await _showMyDialog(data[index].id);
                                      },
                                      icon: Icon(Icons.delete, color: Colors.red,),
                                    ),
                                    SizedBox(width: 10,),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => AdminDashbord(pageIndex: 1, existingPortfolio: data[index]),
                                            settings: RouteSettings(name: '/admin-edit-portfolio')
                                        ));
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        );
                      },

                    ),
                  );
                }else{
                  return NoPortfolioFound();
                }
              }
            ),


          ],
        ),
      ),
    );
  }

   Future<void> _showMyDialog(id) async {
     return showDialog<void>(
       context: context,
       barrierDismissible: false, // user must tap button!
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text('Are you sure?'),
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text('Do you want to delete this portfolio?'),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: Text('YES'),
               onPressed: () async{
                 await _firestore.collection("portfolio").doc(id).delete();
                 Navigator.pop(context);
               },
             ),
             TextButton(
               child: Text('NO'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
}


class NoPortfolioFound extends StatelessWidget {
  const NoPortfolioFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text("No Portfolio Found"),),
    );
  }


  ///flutter alert dialog

}

