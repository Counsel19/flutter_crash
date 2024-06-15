final RegExp EMAIL_VALIDATION_REGEX =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final RegExp PASSWORD_VALIdATION_REGEX = RegExp(r'(?=.*?[0-9]).{6,}$');
final RegExp NAME_VALIdATION_REGEX = RegExp(r'^[a-zA-Z ]+$');