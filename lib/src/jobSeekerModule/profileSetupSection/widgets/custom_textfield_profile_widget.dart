import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/appcolors.dart';

class CustomProfileTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final String? Function(String?)? validator;
  final bool enabled;
  final String suffixIcon;
  final bool showsuffixicon;
  final TextInputType textInputType;

  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;

  const CustomProfileTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hinText,
      this.validator,
      this.onTap,
      required this.enabled,
      required this.suffixIcon,
      required this.showsuffixicon,
      this.textInputType = TextInputType.text,
      this.onChanged,
      this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 55,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.whitecolor),
        child: TextFormField(
          enabled: enabled,
          style: const TextStyle(fontSize: 13),
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          keyboardType: textInputType,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
              border: InputBorder.none,
              isCollapsed: false,
              isDense: false,
              errorStyle: const TextStyle(
                fontSize: 10,
              ),
              hintText: hinText,
              suffixIcon: showsuffixicon == true
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                          SvgPicture.asset(suffixIcon, height: 10, width: 10),
                    )
                  : const SizedBox(),
              contentPadding: const EdgeInsets.only(top: 12, left: 14),
              hintStyle:
                  const TextStyle(color: AppColors.greyColor, fontSize: 13)),
        ),
      ),
    );
  }
}
