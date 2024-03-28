import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/models/project.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:universal_html/html.dart' as html;

class ProjectActions extends StatelessWidget {
  const ProjectActions({super.key, required this.project});

  final QueryDocumentSnapshot<Map<String, dynamic>> project;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          project["appleStoreLink"].toString().isNotEmpty ?
            Expanded(
              child: CustomButton(
                label: 'Apple Store',
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  html.window.open(project["appleStoreLink"]!, '_blank');
                },
              ),
            ) : Center(),
            project["videoLink"].toString().isNotEmpty ? Expanded(
              child: CustomButton(
                label: 'Video',
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  html.window.open(project["videoLink"]!, '_blank');
                },
              ),
            ) : Center(),

          project["appleStoreLink"].toString().isNotEmpty ? Expanded(
              child: CustomButton(
                label: 'play store',
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  html.window.open(project["googlePlayLink"]!, '_blank');
                },
              ),
            ) : Center(),
          project["appleStoreLink"] == null &&
              project["videoLink"] == null &&
              project["googlePlayLink"] == null ?
            Expanded(
              child: CustomButton(
                label: 'No actions available',
                borderColor: AppColors.primaryColor,
                onPressed: () {},
              ),
            ) : Center()
        ],
      ),
    );
  }
}
