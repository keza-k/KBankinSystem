class KValidator {

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account Number is required.';
    }
    print("The value is====$value");

    final RegExp alphabeteregex = RegExp(r'[a-zA-Z]');

    if (alphabeteregex.hasMatch(value)) {
      return 'Please Enter only numbers';
    }
    if (value.length < 6 || value.length > 6 ) {
      return 'Please enter a valid Account Number';
    }

    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'No special characters';
    }
    return null;
  }
static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required.';
    }
    final RegExp alphabeteregex = RegExp(r'[a-zA-Z]');

    if (alphabeteregex.hasMatch(value)) {
      return 'Please Enter only numbers';
    }
    
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'No special characters';
    }
    return null;
  }

    static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    
    final RegExp regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!regex.hasMatch(value)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pin is required.';
    }
    if (value.length < 6 || value.length > 6  ) {
      return "Pin must be at least 6 characters long.";
    }
    return null;
  }

  static String? validateNames(String? value) {
    if (value == null || value.isEmpty) {
      return 'Atleast one name is required';
    }else if (value.length < 2) {
      return 'Name must be at least 2 characters';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
}


  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required.';
    }
    // if (value.length < 6 || value.length > 6  ) {
    //   return "O must be at least 6 characters long.";
    // }
    return null;
  }
}