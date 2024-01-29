// ignore_for_file: inference_failure_on_function_invocation, always_declare_return_types, avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:job_search_app/features/widgets/custom_progress_indicator.dart';
import 'package:job_search_app/jobDescriptionScreen/job_description_screen.dart';
import 'package:job_search_app/modals/repo/repo.dart';
import 'package:job_search_app/themes/font_styles.dart';

class ApplyJobSection extends StatelessWidget {
  final Size size;

  const ApplyJobSection({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    callApi() async {
      final data = await Repo.callResponse();
      return data;
    }

    return Column(
      children: [
        FutureBuilder(
          future: callApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final jobs = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return JobDescriptionScreen(
                            size: size,
                            job: jobs![index],
                          );
                        },
                        backgroundColor: Colors.transparent,
                        enableDrag: true,
                      );
                    },
                    child: Card(
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(jobs?[index].thumbnailUrl ?? ""),
                        ),
                        title: Text(
                          cleanCompanyName(
                            jobs?[index].title ?? "",
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          jobs?[index].title ?? "",
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        trailing: Icon(
                          Icons.circle,
                          color: Colors.blue[900],
                          size: 40,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: jobs?.length ?? 0,
              );
              //Text(jobs.toString());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error fetching the jobs!',
                  style: FontStyles.boldStyle,
                ),
              );
            }

            return const CustomProgressIndicator();
          },
        ),
      ],
    );
  }
}

String cleanCompanyName(String name) {
  return name.split(' ').take(2).join(' ');
}
