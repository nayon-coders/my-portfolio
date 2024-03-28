import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../blocs/home_bloc/home_bloc.dart';

class IntoActions extends StatelessWidget {
  const IntoActions({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      CustomButton(
        label: "Download CV",
        icon: Icons.file_copy,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          html.window.open("https://docs.google.com/document/d/1MoHNJdH2Kdw3SyQLe76dCtDRQavvFGrh/edit?usp=sharing&ouid=100112880830482483925&rtpof=true&sd=true", '_blank');
        },
        width: 160,
      ),
      context.width < DeviceType.ipad.getMaxWidth()
          ? const SizedBox(height: 6)
          : const SizedBox(width: 32),
      CustomButton(
        backgroundColor: Colors.red,
        label:"My Video",
        icon: Icons.play_circle,
        borderColor: Colors.red,
        onPressed: () {
          html.window.open("https://www.youtube.com/watch?v=ZD9zhJAfCT4", '_blank');
        },
        width: 160,
      ),
      context.width < DeviceType.ipad.getMaxWidth()
          ? const SizedBox(height: 6)
          : const SizedBox(width: 32),
      CustomButton(
        label: AppBarHeaders.projects.getString(),
        icon: Icons.remove_red_eye,
        borderColor: AppColors.primaryColor,
        onPressed: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(2));
        },
        width: 160,
      ),
    ];
    return context.width < DeviceType.ipad.getMaxWidth()
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: actions,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: actions,
          );
  }
}
