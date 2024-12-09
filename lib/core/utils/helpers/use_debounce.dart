import 'dart:async';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A custom hook that debounces a value.
/// It waits for [duration] after the last change before executing [callback].
void useDebounce(
  String value,
  Duration duration,
  void Function() callback,
) {
  useEffect(() {
    final timer = Timer(duration, callback);
    return () => timer.cancel();
  }, [value]);
}
