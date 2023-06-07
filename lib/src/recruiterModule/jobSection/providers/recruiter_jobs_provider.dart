import 'package:flutter/material.dart';
import 'package:get_paid/helpers/showsnackbar.dart';
import 'package:get_paid/src/recruiterModule/jobSection/models/recruiter_all_jobs_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/models/recruiter_job_details_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/services/recruiter_jobs_services.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../utils/text_utils.dart';

class RecruiterJobsProvider extends ChangeNotifier {
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  DateTime? selectedDate;

  bool isSwitched = false;

  int? index;

  int? indexOfWorkplace;
  String? selectedOption;

  String? selectedCountry;

  bool isLoading = false;

  RecruiterJobsServices recruiterJobsServices = RecruiterJobsServices();

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

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

  String? selectedWorkPlace;

  updateDataOfWorkPlace(int indexComing) {
    indexOfWorkplace = indexComing;

    selectedWorkPlace = workplaceList[indexComing].toString();
    notifyListeners();
    dp(msg: "selected option", arg: selectedWorkPlace.toString());
  }

  final List<String> workplaceList = [
    'On Site',
    'Remote',
  ];

  final List<String> skillsList = [];

  addSkillInList(String skill) {
    skillsList.add(skill);
    notifyListeners();
  }

  removeSkillFromList(int index) {
    skillsList.removeAt(index);
    notifyListeners();
  }

  sendCreateJobRequest(
    String recruiterId,
    String title,
    String salary,
    String description,
  ) async {
    try {
      if (selectedDate == null) {
        showErrorSnackBarMessage(content: "Please Choose Job Date");
      } else if (selectedStartTime == null) {
        showErrorSnackBarMessage(content: "Please Choose Job Start Time");
      } else if (selectedEndTime == null) {
        showErrorSnackBarMessage(content: "Please Choose Job End Time");
      } else if (selectedOption == null) {
        showErrorSnackBarMessage(content: "Please Choose CheckIn Occurrence");
      } else if (selectedCountry == null) {
        showErrorSnackBarMessage(content: "Please Choose Job Location");
      } else if (selectedWorkPlace == null) {
        showErrorSnackBarMessage(content: "Please Choose WorkPlace");
      } else if (skillsList.isEmpty || skillsList.length < 2) {
        showErrorSnackBarMessage(content: "Please add least 2 skills");
      } else {
        String recruiterUserID = await HiveLocalStorage.readHiveValue(
          boxName: TextUtils.recruiterIDBox,
          key: TextUtils.recruiterIdKey,
        );

        dp(msg: "hive recruiter user id", arg: recruiterUserID.toString());
        makeLoadingTrue();
        recruiterJobsServices
            .createJob(
          recruiterUserID,
          //"6472183b656aa37a8b8eb011",
          title,
          selectedDate.toString(),
          "$selectedStartTime-$selectedEndTime",
          isSwitched,
          selectedOption.toString(),
          salary,
          "dfdd",
          selectedCountry.toString(),
          selectedWorkPlace.toString(),
          skillsList,
          description,
        )
            .whenComplete(() {
          makeLoadingFalse();
          getAllRecruiterJobsProvider();
          disCardJob();
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

  disCardJob() {
    selectedDate = null;
    selectedStartTime = null;
    selectedEndTime = null;
    selectedOption = null;
    selectedCountry = null;
    selectedWorkPlace = null;
    skillsList.clear();
  }

  ///get all recruiter jobs

  RecruiterAllJobsModel? recruiterAllJobsModel;

  getAllRecruiterJobsProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        recruiterAllJobsModel =
            await recruiterJobsServices.getAllRecruiterJobs().whenComplete(() {
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

  RecruiterJobDetailsModel? recruiterJobDetailsModel;

  getRecruiterJobsDetailsProvider(String jobID) async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();
        recruiterJobDetailsModel = await recruiterJobsServices
            .getrecruiterJobDetails(jobID)
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

  deleteJobProvider(String jobID) async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();
        await recruiterJobsServices.deleteJob(jobID).whenComplete(() {
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
