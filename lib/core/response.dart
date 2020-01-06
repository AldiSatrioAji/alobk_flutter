extension ResponseExtension on int {
  bool get responseStatusOk {
    return this == 200;
  }
  bool get responseStatusFailure {
    return this == 201;
  }
  bool get responseStatusError {
    return this < 200 || this > 400;
  }
}