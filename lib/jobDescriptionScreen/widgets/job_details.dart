// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search_app/constants/svg_color.dart';
import 'package:job_search_app/modals/data/data_model.dart';

class JobDetails extends StatelessWidget {
  final DataModel job;

  const JobDetails({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack( children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 50.0),
            CircleAvatar(
              backgroundImage: NetworkImage(job.url ?? ""),
              radius: 36.0,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: defaultPadding),
            Text(
              cleanCompanyName(job.title ?? ""),
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ),
            // const SizedBox(height: defaultPadding / 2),
            // Text(
            //   "${job.city}, ${job.country}",
            //   style: const TextStyle(
            //     color: Colors.grey,
            //     fontSize: 16.0,
            //   ),
            // ),
            const SizedBox(height: 1.7 * defaultPadding),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //    ,
                  Text(
                    DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    // DateTime.now().day.toString(),
                    //"Date : Jan 2024",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  // Text(
                  //   job.quaification,
                  //   style: const TextStyle(color: Colors.grey),
                  // ),
                  // const SizedBox(height: 2 * defaultPadding),
                  // Text(
                  //   "About The Job",
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(height: defaultPadding / 2),
                  // Text(
                  //   job.aboutTheJob,
                  //   style: const TextStyle(color: Colors.grey),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 200.0),
          ],
        ),
      ]),
    );
  }
}

String cleanCompanyName(String name) {
  return name.split(' ').take(2).join(' ');
}
