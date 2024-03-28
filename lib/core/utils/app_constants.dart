import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<CustomService> services = [
    CustomService(
      service: 'MOBILE DEVELOPMENT',
      logo: AppAssets.androidLogo,
      description:
          'I am a Junior mobile developer. I have experience using Dart and Flutter Framework.',
    ),
    CustomService(
      service: 'UI & UX DESIGNING',
      logo: AppAssets.uiDesignLogo,
      description:
          'I design beautiful web interfaces with Figma and Adobe XD. I design beautiful web interfaces with Figma and Adobe XD.',
    ),
    CustomService(
      service: 'WEB SCRAPING',
      logo: AppAssets.scrappingLogo,
      description:
          'I can collect content and data from the internet then manipulate and analyze as needed.',
    ),
  ];
  static const List<Project> projects = [
    Project(
      name: 'Bigzbe USER',
      imageUrl:
          'assets/images/5.jpeg',
      description:
          'Welcome to Bigzbe! We are determined to facilitate shopping from your favorite online store. ',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.bigzbe_user.app',
      appleStore: 'https://apps.apple.com/nl/app/bigzbe/id6443802680',
    ),
    Project(
      name: 'Bigzbe SELLER',
      imageUrl:
      'assets/images/6.jpeg',
      description:
      'Bizgbe brings comfort and ease for sellers with bigzbe seller portal for Android. ',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.bigzbe_seller.app',
      appleStore: 'https://apps.apple.com/us/app/bigzbe-seller-portal/id6443502643',
    ),

    Project(
      name: 'Shinee',
      imageUrl:
      'assets/images/3.jpeg',
      description:
      'At SHINEE, we equip you with the knowledge and skills so that you’re ready for work in your chosen industry or profession. Our nationally recognised training programs are designed to meet the needs of today’s learners',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.shinee.app&hl=en&gl=US',
      appleStore: 'https://apps.apple.com/gb/app/shinee/id6447059847',
    ),


    Project(
      name: 'HRMS & ACCOUNTS ',
      imageUrl:
      'assets/images/10.jpeg',
      description:
      'ASIA Solutions offers the complete business solution with its HRMS and Accounts Module focusing on the SME sector where money and manpower isn’t abundant.',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.asiasolutios.hrm&hl=en&gl=US',
      appleStore: 'https://apps.apple.com/gb/app/asiasolution-xyz/id1668156777',
    ),

    Project(
        name: "La Spiga D'oro",
        imageUrl:
        'assets/images/14.png',
        description:
        'While offering our products at low prices. Thanks to our online ordering system, you can easily choose your favorite...',
        googlePlay: 'https://play.google.com/store/apps/details?id=com.soclose.laspigadoro',
        appleStore: "https://apps.apple.com/ua/app/la-spiga-doro/id6449036625?platform=iphone"
    ),
    Project(
      name: 'MR DEAL',
      imageUrl:
      'assets/images/2.jpeg',
      description:
      'MR DEAL is on the verge of a breakthrough to create an ecosystem that connects customers looking for mobile screen repair with our approved vendors.',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.mrdealuser.app',
    ),
    Project(
      name: 'MR DEAL SELLER',
      imageUrl:
      'assets/images/project/1.jpeg',
      description:
      'MR DEAL is on the verge of a breakthrough to create an ecosystem that connects customers looking for mobile screen repair with our approved vendors.',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.mrdealvendor.app',
    ),

    Project(
      name: 'Elbrit Central',
      imageUrl:
      'assets/images/8.jpeg',
      description:
      'Elbrit Life Sciences Private Limited is a vertically integrated Indian Pharmaceutical company. This app is solely designed for the use of internal employees of the organization. ',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.shinee.app&hl=en&gl=US',
    ),

    Project(
      name: 'Peacock Supplies',
      imageUrl:
      'assets/images/13.png',
      description:
      'Peacock Supplies is the UK’s leading supplier of all faith-based and multicultural celebration products such as party ...',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.shinee.app&hl=en&gl=US',
    ),



  ];
}
