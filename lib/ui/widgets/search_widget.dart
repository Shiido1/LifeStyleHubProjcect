
  T  filter<T>(String str, Iterable<T> values) {
  return values.firstWhere(
    (value) => value.toString().split('.')[1] == str,
    orElse: () => throw Exception(),
  );
}