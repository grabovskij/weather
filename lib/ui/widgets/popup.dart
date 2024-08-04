import 'package:flutter/material.dart';

typedef OverlayBuilder = Widget Function(BuildContext context, VoidCallback hide);

/// Виджет, позволяющий создать всплывающую подсказку с привязкой оверлея к ребенку.
class Popup extends StatefulWidget {
  /// Размер оверлея.
  final Size overlaySize;

  /// Сдвиг оверлея относительно якорной точки [followerAnchor].
  final Offset offset;

  /// Якорная точка относительно ребенка.
  final Alignment targetAnchor;

  /// Якорная точка относительно оверлея.
  final Alignment followerAnchor;

  /// Функция-билдер оверлея.
  final OverlayBuilder overlayBuilder;

  /// Ребенок, относительно которого показываем оверлей.
  final Widget child;

  /// Конструктор для создания виджета [Popup].
  const Popup({
    required this.child,
    required this.overlayBuilder,
    this.overlaySize = const Size(100, 40),
    this.followerAnchor = Alignment.bottomRight,
    this.targetAnchor = Alignment.topRight,
    this.offset = Offset.zero,
    super.key,
  });

  @override
  State<Popup> createState() => _PopupState();
}

/// Состояние для виджета [Popup].
class _PopupState extends State<Popup> with _PopupApiMixin, _PopupBuilderMixin, _PopupOverlayMixin {}

/// Mixin для управления показом и скрытием оверлея.
mixin _PopupApiMixin on State<Popup> {
  @mustCallSuper
  void show() {}

  @mustCallSuper
  void hide() {}
}

/// Mixin для построения виджета [Popup].
mixin _PopupBuilderMixin on _PopupApiMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: show,
      child: widget.child,
    );
  }
}

/// Mixin для управления оверлеем в виджете [Popup].
mixin _PopupOverlayMixin on _PopupApiMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  /// Получает позицию ребенка относительно глобальных координат.
  Offset? get position {
    final renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return null;
    }

    return renderBox.localToGlobal(Offset.zero);
  }

  @override
  void show() {
    super.show();

    hide();

    Overlay.of(context).insert(
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          width: widget.overlaySize.width,
          height: widget.overlaySize.height,
          child: CompositedTransformFollower(
            link: _layerLink,
            offset: widget.offset - Offset(position?.dx ?? 0, 0),
            targetAnchor: widget.targetAnchor,
            followerAnchor: widget.followerAnchor,
            showWhenUnlinked: false,
            child: widget.overlayBuilder(context, hide),
          ),
        ),
      ),
    );
  }

  @override
  void hide() {
    super.hide();

    if (_overlayEntry == null) {
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: super.build(context),
    );
  }
}
