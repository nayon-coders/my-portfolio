import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase/admin/portfolio_controller.dart';
import 'package:portfolio/presentation/admin/dashboard/admin-dashboard.dart';
import 'dart:html' as html;

import '../../widgets/app_button.dart';
import '../controller.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';


class AdminAddPortfolio extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? portfolio;
  const AdminAddPortfolio({super.key, this.portfolio});

  @override
  State<AdminAddPortfolio> createState() => _AdminAddPortfolioState();
}

class _AdminAddPortfolioState extends State<AdminAddPortfolio> {
  final _portfolioKey = GlobalKey<FormState>();

  final _projectName = TextEditingController();
  final _coplitionDate = TextEditingController();
  final _shortDes = TextEditingController();
  final _prorotyLavel = TextEditingController();
  final _googlePlayLink = TextEditingController();
  final _appleStoreLink = TextEditingController();
  final _videLink = TextEditingController();


  bool _isLoading = false;


  var existingPortfolioImage;

  Uint8List? _unitImagePath;


  //take image
  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      print("this is files === $files");
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _unitImagePath =
              Base64Decoder().convert(reader.result
                  .toString()
                  .split(",")
                  .last);
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  bool isLoading = false;

  //init statu to set edit value
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget!.portfolio != null) {
      setState(() {
        _projectName.text = widget!.portfolio!.data()["projectName"] ?? "";
        _coplitionDate.text = widget!.portfolio!.data()["completionDate"] ?? "";
        _shortDes.text = widget!.portfolio!.data()["shortDes"]  ?? "" ;
        _prorotyLavel.text = widget!.portfolio!.data()["priority"]  ?? "" ;
        _googlePlayLink.text = widget!.portfolio!.data()["googlePlayLink"]  ?? "";
        _appleStoreLink.text = widget!.portfolio!.data()["appleStoreLink"] ?? ""  ;
        _videLink.text = widget!.portfolio!.data()["videoLink"] ?? "";
        existingPortfolioImage = widget!.portfolio!.data()["image"]   ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Create New Portfolio ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 20,),
            Text("Project Name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _projectName,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Project Name"
              ),
            ),
            SizedBox(height: 20,),
            Text("Project Complete Date",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _coplitionDate,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Project complete date"
              ),
            ),


            SizedBox(height: 20,),
            Text("Google Play Store Link",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _googlePlayLink,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Google Play Store Link"
              ),
            ),


            SizedBox(height: 20,),
            Text("Apple Store Link",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _appleStoreLink,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Apple Store Link"
              ),
            ),


            SizedBox(height: 20,),
            const Text("Video Link",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _videLink,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Video Link"
              ),
            ),


            SizedBox(height: 20,),
            const Text("Short Description",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              maxLines: 5,
              controller: _shortDes,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Short Description"
              ),
            ),
            SizedBox(height: 20,),
            const Text("Set priority Level",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _prorotyLavel,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Priority Level"
              ),
            ),
            SizedBox(height: 20,),
            const Text("Upload thumb-line",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    startWebFilePicker();
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("Select Photo")),
                  ),
                ),
                SizedBox(width: 10,),
                _unitImagePath != null ? Container(
                  width: 100,
                  height: 50,
                  child: Image.memory(_unitImagePath!),
                )
                    : existingPortfolioImage != null ? Container(
                  width: 100,
                  height: 50,
                  child: Image.network(widget!.portfolio!.data()["image"] ?? "" ),
                ) : Center()
              ],
            ),
            SizedBox(height: 30,),
            AppButton(
              text: "Add",
              onClick: () =>
              widget!.portfolio != null
                  ? _editPortfolio()
                  : _addPotfolio(),
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }

  _addPotfolio() async {
    setState(() => _isLoading = true);
    var image = await AdminViewController.uploadImage(
        image: _unitImagePath!, path: "portofolio/${Random().nextInt(10000)}");
    var todayDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    print("image ==== ${image}");
    int id = Random().nextInt(1000);

    var data = {
      "projectName": _projectName.text,
      "completionDate": _coplitionDate.text,
      "shortDes": _shortDes.text,
      "googlePlayLink": _googlePlayLink.text,
      "appleStoreLink": _appleStoreLink.text,
      "videoLink": _videLink.text,
      "image": image,
      "date": todayDate,
      "status": 1,
      "id": "$id",
      "priority ": "${_prorotyLavel.text}",
      "category": "app"
    };


    bool response = await PortfolioController.addPortolfio(
        data: data); //upload into firebase
    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Portfolio added successfully"),
        backgroundColor: Colors.green,));
      _unitImagePath = null;
      _videLink.clear();
      _appleStoreLink.clear();
      _googlePlayLink.clear();
      _shortDes.clear();
      _coplitionDate.clear();
      _projectName.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to add portfolio"),
        backgroundColor: Colors.red,));
    }

    setState(() => _isLoading = false);
  }


  //efit portfolio
  _editPortfolio() async {
    setState(() => _isLoading = true);
    var image = _unitImagePath != null
        ? await AdminViewController.uploadImage(
        image: _unitImagePath!, path: "portofolio/${Random().nextInt(10000)}")
        : existingPortfolioImage;

    var todayDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    print("image ==== ${image}");

    var data = {
      "projectName": _projectName.text,
      "completionDate": _coplitionDate.text,
      "shortDes": _shortDes.text,
      "googlePlayLink": _googlePlayLink.text,
      "appleStoreLink": _appleStoreLink.text,
      "videoLink": _videLink.text,
      "image": image,
      "date": todayDate,
      "status": 1,
      "id": "${widget!.portfolio!.id}",
      "priority ": "${_prorotyLavel.text}",
      "category": "app"
    };

    bool response = await PortfolioController.editPortfolio(
        data: data, id: widget!.portfolio!.id ); //upload into firebase
    if (response) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => AdminDashbord(pageIndex: 0, existingPortfolio: null,),
          settings: RouteSettings(name: '/admin-dashboard')
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Portfolio update successfully"),
        backgroundColor: Colors.green,));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to update portfolio"),
        backgroundColor: Colors.red,));
    }
  }
}

