import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class RecruiterJobProposalCardsWidget extends StatefulWidget {
  final All all;

  const RecruiterJobProposalCardsWidget({
    Key? key,
    required this.all,
  }) : super(key: key);

  @override
  State<RecruiterJobProposalCardsWidget> createState() =>
      _RecruiterJobProposalCardsWidgetState();
}

class _RecruiterJobProposalCardsWidgetState
    extends State<RecruiterJobProposalCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: AppColors.lightGrey),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CacheNetworkImageWidget(
                  imgUrl: widget.all.proposedBy!.photo.toString(),
                  radius: 13,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.all.proposedBy!.email.toString(),
                          //   "",
                          //  "Creative UI UX Designer",
                          style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,

                            color: AppColors.blackColor.withOpacity(0.8),
                            //decoration: TextDecoration.underline
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.all.proposedBy!.phoneNumber.toString(),
                          //   "",
                          //  "Creative UI UX Designer",
                          style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,

                            color: AppColors.greyColor.withOpacity(0.9),
                            //decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SvgPicture.asset("assets/images/morevert.svg")
                  ],
                )
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             widget.all.coverLetter.toString(),
          //             //   "",
          //             //  "Creative UI UX Designer",
          //             style: fontW7S12(context)!.copyWith(
          //               fontWeight: FontWeight.w400,
          //               fontSize: 17,
          //
          //               color: AppColors.blackColor.withOpacity(0.8),
          //               //decoration: TextDecoration.underline
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             widget.all.createdAt!.format("Y-M-d   h:i A"),
          //             // "1 min ago",
          //             style: fontW7S12(context)!.copyWith(
          //               fontWeight: FontWeight.w400,
          //               fontSize: 12,
          //
          //               color: AppColors.greyColor.withOpacity(0.8),
          //               //decoration: TextDecoration.underline
          //             ),
          //           ),
          //         ],
          //       ),
          //       SvgPicture.asset("assets/images/morevert.svg"),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.greyColor.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      "Time Frame",
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
                      widget.all.jobDetails!.time
                          .toString()
                          .replaceAll("TimeOfDay(", "")
                          .replaceAll(")", ""),
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: AppColors.blackColor,
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
                      "Bid Amount",
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
                      "\$${widget.all.bidAmount}",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: AppColors.blackColor.withOpacity(0.8),
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
                      widget.all.status.toString(),
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: widget.all.status == "Active" ||
                                widget.all.status == "Approved" ||
                                widget.all.status == "Shortlisted"
                            ? AppColors.appcolor.withOpacity(0.9)
                            : AppColors.redColor,
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
    );
  }
}
