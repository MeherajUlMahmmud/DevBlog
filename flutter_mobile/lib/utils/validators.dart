class Validator {
  static bool isValidName(String name) {
    Pattern pattern =
        r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$'; //regex for name
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(name))
      return true;
    else
      return false;
  }

  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; //regex for email
    RegExp regex = new RegExp(pattern);
    if (email.isEmpty || !regex.hasMatch(email)) {
      return false;
    }
    return true;
  }

  static bool isValidPassword(String password) {
    if (password.isEmpty || password.length < 8) {
      return false;
    }
    return true;
  }

  static bool isValidConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  static bool isValidPhone(String phone) {
    Pattern pattern = r'^\d{11}$'; //regex for phone
    RegExp regex = new RegExp(pattern);
    if (phone.isEmpty || !regex.hasMatch(phone)) {
      return false;
    }
    return true;
  }

  static bool isValidTitle(String title) {
    if (title.isEmpty || title.length < 3) {
      return false;
    }
    return true;
  }

  static bool isValidContent(String content) {
    if (content.isEmpty || content.length < 3) {
      return false;
    }
    return true;
  }

  static bool isValidComment(String comment) {
    if (comment.isEmpty) {
      return false;
    }
    return true;
  }

  static bool isValidSubject(String subject) {
    if (subject.isEmpty || subject.length < 3) {
      return false;
    }
    return true;
  }

  static bool isValidMessage(String message) {
    if (message.isEmpty || message.length < 10) {
      return false;
    }
    return true;
  }
}
