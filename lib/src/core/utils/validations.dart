bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

String? emailValidator(String? content) {
  if (content == null) {
    return "Unknown error";
  } else if(content.isEmpty){
    return "Email cannot be empty";
  }  else if (!isValidEmail(content)) {
    return "Invalid email";
  } else {
    return null;
  }
}

String? passwordValidator(String? content) {
  if (content == null) {
    return "Unknown error";
  } else if(content.isEmpty){
    return "Password cannot be empty";
  } else if (content.length < 6) {
    return "Password cannot be less than 6 characters";
  } else {
    return null;
  }
}

String? usernameValidator(String? content) {
  if (content == null) {
    return "Unknown error";
  } else if(content.isEmpty){
    return "Username cannot be empty";
  } else if (content.length < 4) {
    return "Username cannot be less than 4 characters";
  } else {
    return null;
  }
}

