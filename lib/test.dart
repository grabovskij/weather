import 'package:flutter/widgets.dart';

extension MapRegistery on Map<Type, dynamic> {
  void register<T>(
    T value, {
    bool replaced = false,
  }) {
    if (!replaced) {
      assert(
        keys.contains(value.runtimeType),
        'has registered value of type: ${value.runtimeType}',
      );
    }

    this[value.runtimeType] = value;
  }

  T? getOrNull<T>() {
    if (keys.contains(T)) {
      return this[T];
    }

    return null;
  }
}

mixin class Scope {
  final _scope = <Type, dynamic>{};

  void register<T>(T value, {bool replaced = false}) => _scope.register(value, replaced: replaced);

  T? getOrNull<T>() => _scope.getOrNull<T>();

  void dispose() {
    _scope.clear();
  }
}

class InheritedScope extends InheritedWidget with Scope {
  static InheritedScope? maybeOf(BuildContext context) => context.getInheritedWidgetOfExactType<InheritedScope>();

  static InheritedScope of(BuildContext context) => maybeOf(context)!;

  InheritedScope({
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(InheritedScope oldWidget) {
    return false;
  }
}
