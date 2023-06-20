class ValidatorHelpers {
  static String emailRegx =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String userReg = r"^[a-zA-Z]+([,._]?[a-zA-Z]+)*$" "";

  static String newReg = r"^[a-zA-Z]+([,._]?[a-zA-Z]+)*$" "";

//[^#$%&'*+-/=?^_`{|}]
  static String aboutMe = r"[a-z A-Z]+[@!-,.]?[0-9]?";

  static String addressRegx = r"\d{1,5}\s\w.\s(\b\w*\b\s){1,2}\w*\.[0-9]";

  static String newAddress = r"A-Za-z0-9'\.\,\@\!,";

  static String newName = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";

  static String? validateCommitteeName(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Committee name is required";
    }

    // if (!RegExp(userReg).hasMatch(value!.trim().replaceAll(" ", ""))) {
    //   return "please enter valid characters";
    // }

    if (value!.length > 20) {
      return "only 20 characters are allow";
    }

    return null;
  }

  static String? validateName(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "name is required";
    }

    if (!RegExp(userReg).hasMatch(value!.trim().replaceAll(" ", ""))) {
      return "please enter valid characters";
    }

    if (value.length > 25) {
      return "only 25 characters are allow";
    }

    return null;
  }

  static String? validateAboutYou(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "About You is required";
    }

    if (!RegExp(userReg).hasMatch(value!.trim().replaceAll(" ", ""))) {
      return "please enter valid characters";
    }

    if (value.length > 35) {
      return "only 35 characters are allow";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Pin is required";
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return "Only Numbers Allowed";
    }

    if (value.length != 4) {
      return "Pin should be 4 digits";
    }

    return null;
  }

  static String? validateEmailCode(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Code is required";
    }

    return null;
  }

  static String? validateCommitteeOverallDuration(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Committee Overall Duration is required";
    }

    // if (!RegExp(userReg).hasMatch(value!.trim().replaceAll(" ", ""))) {
    //   return "please enter valid characters";
    // }

    if (value!.length > 25) {
      return "only 25 characters are allow";
    }

    return null;
  }

  static String? validateCommitteeTotalAmount(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Committee Amount  is required";
    }

    // if (!RegExp(userReg).hasMatch(value!.trim().replaceAll(" ", ""))) {
    //   return "please enter valid characters";
    // }

    if (value!.length > 25) {
      return "only 25 characters are allow";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    //

    if (value?.isEmpty ?? true) {
      return "Phone Number is required";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return "invalid phone number";
    }

    if (value.length < 10) {
      return "invalid phone number";
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "email should not be empty";
    }
    bool emailValid = RegExp(emailRegx).hasMatch(email);

    if (!emailValid) {
      return 'please use valid email address';
    }
    if (email.length > 100) {
      return "not allow more than 100 characters";
    }
    return null;
  }
}
