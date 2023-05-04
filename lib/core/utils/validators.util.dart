class ValidatorUtils {
  static dynamic containsKeyReturn(
    Map<String, dynamic>? json,
    String key,
    dynamic value,
  ) {
    if (json != null && json.containsKey(key)) {
      return json[key];
    }
    {
      return value;
    }
  }
}
