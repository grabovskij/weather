import 'package:flutter/material.dart';

typedef OverlayBuilder = Widget Function(BuildContext context, VoidCallback hide);

/// Mixin для добавления и управления оверлеем в состояниях [State] виджетов.
mixin OverlayBuilderStateMixin<T extends StatefulWidget> on State<T> {
  /// Размер оверлея.
  Size get overlaySize => const Size(100, 40);

  /// Сдвиг оверлея относительно якорной точки [followerAnchor].
  Offset get offset => Offset.zero;

  /// Якорная точка относительно ребенка.
  Alignment get targetAnchor => Alignment.bottomLeft;

  /// Якорная точка относительно оверлея.
  Alignment get followerAnchor => Alignment.topLeft;

  /// Функция-билдер оверлея.
  OverlayBuilder get overlayBuilder;

  /// Ссылка на слой для привязки оверлея.
  final LayerLink layerLink = LayerLink();

  /// Экземпляр [OverlayEntry], представляющий оверлей.
  OverlayEntry? _overlayEntry;

  /// Позиция якорной точки относительно глобальных координат.
  Offset? get _position {
    final renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return null;
    }

    return renderBox.localToGlobal(Offset.zero);
  }

  @override
  void dispose() {
    hide();
    super.dispose();
  }

  /// Показать оверлей.
  void show() {
    hide();

    Overlay.of(context).insert(
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          width: overlaySize.width,
          height: overlaySize.height,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: offset - Offset(_position?.dx ?? 0, 0),
            targetAnchor: targetAnchor,
            followerAnchor: followerAnchor,
            showWhenUnlinked: false,
            child: overlayBuilder(context, hide),
          ),
        ),
      ),
    );
  }

  /// Скрыть оверлей.
  void hide() {
    if (_overlayEntry == null) {
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
