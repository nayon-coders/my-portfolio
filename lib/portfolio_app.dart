import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/admin/auth/login.dart';
import 'package:portfolio/presentation/admin/dashboard/admin-dashboard.dart';
import 'package:portfolio/presentation/admin/pages/app_protfolio.dart';

import 'config/theme_manager.dart';
import 'presentation/blocs/home_bloc/home_bloc.dart';
import 'presentation/views/home_view.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme(),
      title: 'Nayon Coders',
      // home: BlocProvider<HomeBloc>(
      //   create: (context) => HomeBloc(),
      //   child: const HomeView(),
      // ),
      // routes: {
      //   '/': (context) => BlocProvider<HomeBloc>(
      //     create: (context) => HomeBloc(),
      //     child: const HomeView(),
      //   ),
      //   '/admin-login': (context) => AdminLogin(),
      // },
      routes: {
        '/': (context) => BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
          child: const HomeView(),
        ),
        '/admin-login': (context) => AdminLogin(),
        '/admin-dashboard': (context) => AdminDashbord(),
        '/admin-edit-portfolio': (context) => AdminDashbord(),
        '/admin-add-portfolio': (context) => AdminDashbord(),

      },
    );
  }
}
