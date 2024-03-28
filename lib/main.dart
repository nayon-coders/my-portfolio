import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'portfolio_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDZ6r_2HV201iC0LVU34EzxS5ZaJ4mj1iU",
        appId: "1:315441702293:web:7b289005046cb2244c429c",
        messagingSenderId:"315441702293",
        projectId:  "myportofio-a9607",
      storageBucket: "myportofio-a9607.appspot.com",
    )
  );
  Bloc.observer = MyBlocObserver();
  runApp(const PortfolioApp());
}
