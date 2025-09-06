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

}