import 'package:flutter/widgets.dart';
import 'package:weather/core/di/data_source_scope.dart';
import 'package:weather/core/di/repository_scope.dart';

class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataSourceScope(
      child: RepositoryScope(
        child: child,
      ),
    );
  }
}
