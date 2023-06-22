import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/models/jobseeker_proposal_model.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/services/jobseeker_proposal_services.dart';

import '../../../../helpers/showsnackbar.dart';

class JobSeekerProposalProvider extends ChangeNotifier {
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  DateTime? selectedDate;

  bool isSwitched = false;

  bool isLoading = false;
  int? index;

  String? selectedOption;

  final List<String> checkInOcurrencelist = [
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  updateData(int indexComing) {
    index = indexComing;

    selectedOption = checkInOcurrencelist[indexComing].toString();
    notifyListeners();
    dp(msg: "selected option", arg: selectedOption.toString());
  }

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  JobSeekerProposalServices jobSeekerProposalServices =
      JobSeekerProposalServices();

  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          selectedStartTime == null ? TimeOfDay.now() : selectedStartTime!,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity
                .adaptivePlatformDensity, // colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedStartTime) {
      selectedStartTime = pickedTime;
      notifyListeners();
      dp(msg: "start time", arg: selectedStartTime);
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedEndTime == null ? TimeOfDay.now() : selectedEndTime!,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity
                .adaptivePlatformDensity, // colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedEndTime) {
      selectedEndTime = pickedTime;
      notifyListeners();
      dp(msg: "end time", arg: selectedEndTime!.period);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity
                .adaptivePlatformDensity, // colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      notifyListeners();
      dp(msg: "selected date", arg: selectedDate.toString());
    }
  }

  sendCreateJobRequest(
    String recruiterId,
    String jobID,
    String bidAmount,
    String coverLetter,
  ) async {
    try {
      if (selectedStartTime == null) {
        showErrorSnackBarMessage(content: "Please Choose Job Start Time");
      } else if (selectedEndTime == null) {
        showErrorSnackBarMessage(content: "Please Choose Job End Time");
      } else if (selectedOption == null) {
        showErrorSnackBarMessage(content: "Please Choose CheckIn Occurrence");
      } else {
        makeLoadingTrue();
        jobSeekerProposalServices
            .createProposal(
                recruiterId,
                jobID,
                bidAmount,
                "$selectedStartTime-$selectedEndTime",
                isSwitched,
                selectedOption!,
                coverLetter)
            .whenComplete(() {
          makeLoadingFalse();
          // getAllRecruiterJobsProvider();
          // disCardJob();
        });

        notifyListeners();
      }
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }

  JobSeekerProposalModel? jobSeekerProposalModel;

  getJobSeekerProposalsProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        jobSeekerProposalModel = await jobSeekerProposalServices
            .getJobSeekerProposals()
            .whenComplete(() {
          makeLoadingFalse();
        });

        notifyListeners();
      });
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }
}
