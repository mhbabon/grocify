
class TValidator {


static String? validateEmptyText(String? fieldName,String? value) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required.';
  }
  return null;
}

  /// Username Validation
  static String? validateUsername(String? userName){
  if(userName == null || userName.isEmpty){
    return 'Username is required.';
    }

  /// Define a regular expression pattern for the username
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

  // Create a RegExp instance from the pattern for the username
    final regex = (RegExp(pattern));

    // Use the hasMatch method to check if the user matches the pattern
    bool isValid = regex.hasMatch(userName);

    // check if  the user name does not start or end with an underscore or hyphen
    if(isValid){
      isValid = !userName.startsWith('_') && !userName.startsWith('-') && !userName.endsWith('_') && !userName.endsWith('-');
    }

    if(!isValid){
      return 'Username is not valid.';
    }
    return null;

  }


  ///---- Email Validation
 ///
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,13}$');


    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }


// Add more custom validators as needed for your specific requirements.
}
