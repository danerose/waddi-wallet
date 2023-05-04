class ValidatorUtils {
  static T containsKeyReturn<T>(
    Map<String, dynamic>? json,
    String key,
    T value,
  ) {
    if (json != null && json.containsKey(key)) {
      return json[key] as T;
    }
    {
      return value;
    }
  }
}
