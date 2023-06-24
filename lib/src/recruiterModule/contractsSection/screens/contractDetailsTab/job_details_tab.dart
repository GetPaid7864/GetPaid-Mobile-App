import 'package:flutter/material.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/providers/recruiter_contracts_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';

class JobDetailsTab extends StatelessWidget {
  const JobDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterContractsProvider>(
        builder: (context, recruiterContractsProvider, __) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Job Description",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: recruiterContractsProvider
                            .recruiterContractDetailsModel!
                            .data!
                            .first
                            .jobDetails!
                            .description
                            .toString(),
                        style: fontW3S12(context)!.copyWith(
                            color: AppColors.blackColor.withOpacity(0.6)))),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Requirements",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: AppColors.lightGrey),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Status",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,

                                    color: AppColors.greyColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  recruiterContractsProvider
                                      .recruiterContractDetailsModel!
                                      .data!
                                      .first
                                      .jobDetails!
                                      .status
                                      .toString(),
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,

                                    color:
                                        AppColors.blackColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: AppColors.greyColor.withOpacity(0.4),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Budget",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,

                                    color: AppColors.greyColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "\$${recruiterContractsProvider.recruiterContractDetailsModel!.data!.first.jobDetails!.salary.toString()}",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,

                                    color:
                                        AppColors.blackColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: AppColors.greyColor.withOpacity(0.4),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Job Type",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,

                                    color: AppColors.greyColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  recruiterContractsProvider
                                      .recruiterContractDetailsModel!
                                      .data!
                                      .first
                                      .jobDetails!
                                      .workplace
                                      .toString(),
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,

                                    color:
                                        AppColors.blackColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TimeFrame",
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                    if (recruiterContractsProvider
                            .recruiterContractDetailsModel!
                            .data!
                            .first
                            .jobDetails!
                            .checkIn ==
                        true) ...[
                      Text(
                        "Requires Check-In",
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.appcolor,
                            fontSize: 11),
                      ),
                    ] else ...[
                      Text(
                        "Do Not Requires Check-In",
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.redColor,
                            fontSize: 11),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: AppColors.lightGrey),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Date",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,

                                    color: AppColors.greyColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  recruiterContractsProvider
                                      .recruiterContractDetailsModel!
                                      .data!
                                      .first
                                      .jobDetails!
                                      .dates!
                                      .toString()
                                      .replaceAll("00:00:00.000", ""),
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,

                                    color:
                                        AppColors.blackColor.withOpacity(0.8),
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 1,
                                  color: AppColors.greyColor.withOpacity(0.4),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Time",
                                      style: fontW7S12(context)!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,

                                        color: AppColors.greyColor
                                            .withOpacity(0.8),
                                        //decoration: TextDecoration.underline
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      recruiterContractsProvider
                                          .recruiterContractDetailsModel!
                                          .data!
                                          .first
                                          .jobDetails!
                                          .time
                                          .toString()
                                          .replaceAll("TimeOfDay(", "")
                                          .replaceAll(")", ""),
                                      style: fontW7S12(context)!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,

                                        color: AppColors.blackColor
                                            .withOpacity(0.8),
                                        //decoration: TextDecoration.underline
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Skills Required",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 60,
                  child: ListView.builder(
                      itemCount: recruiterContractsProvider
                          .recruiterContractDetailsModel!
                          .data!
                          .first
                          .jobDetails!
                          .skills!
                          .length,
                      scrollDirection: Axis.horizontal,
                      // Replace `myList` with your own list of data
                      itemBuilder: (BuildContext context, int index) {
                        // Use the `index` to access the current item in the list
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 32,
                                //width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color:
                                        AppColors.greyColor.withOpacity(0.2)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Center(
                                    child: Text(
                                      recruiterContractsProvider
                                          .recruiterContractDetailsModel!
                                          .data!
                                          .first
                                          .jobDetails!
                                          .skills![index]
                                          .toString(),
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
