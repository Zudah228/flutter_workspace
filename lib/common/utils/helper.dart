class Helper {
  Helper._();
  factory Helper() => _instance;
  static final _instance = Helper._();

  Future<void> testFuture(bool isError,
      {Duration duration = const Duration(milliseconds: 500)}) async {
    await Future.delayed(duration);

    if (isError) throw Error();
  }
}
