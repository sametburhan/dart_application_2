class ValidationMixinForStudet {
  String valFirstName(String value) {
    if (value.length < 2) {
      return "en az 2 karakter olmalı";
    }
  }
}
