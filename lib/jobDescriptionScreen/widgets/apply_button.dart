import 'package:flutter/material.dart';
import 'package:job_search_app/constants/svg_color.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2 * defaultPadding,
        vertical: 5 * defaultPadding,
      ),
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Job Applied Successfully'),
          ));
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: Colors.black,
          alignment: Alignment.center,
          // shape: const StadiumBorder(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
          minimumSize: const Size(double.infinity, 80.0),
        ),
        child: const Text("Apply for a job"),
      ),
    );
  }
}
