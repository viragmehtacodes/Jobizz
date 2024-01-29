import 'package:flutter/material.dart';
import 'package:job_search_app/constants/svg_color.dart';
import 'package:job_search_app/modals/data/data_model.dart';
import './widgets/apply_button.dart';
import './widgets/job_details.dart';

class JobDescriptionScreen extends StatelessWidget {
  final DataModel job;

  const JobDescriptionScreen({
    Key? key,
    required this.size,
    required this.job,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: size.height * 0.65,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 1.5 * defaultPadding),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(3, 0),
                blurRadius: 8.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: JobDetails(job: job),
        ),
        const ApplyButton(),
      ],
    );
  }
}
