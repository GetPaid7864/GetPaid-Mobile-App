import 'package:flutter/material.dart';
import 'package:get_paid/src/recruiterModule/jobSection/widgets/shortlistedJobCardWidget.dart';

class ApplicantsTab extends StatelessWidget {
  const ApplicantsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              // number of items in the list
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // returns a widget for each item in the list
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: const ShortListedJobCardWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
