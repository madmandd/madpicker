import 'package:flutter/material.dart';

Map<int, double> _correctSizes = {};

class ColorsConstant {
  static const List<Color> colors1 = [
    Color(0xFFFFFFFF),
    Color(0xFF000000),
    Color(0xFF3897F1),
    Color(0xFF70C04F),
    Color(0xFFFDCB5C),
    Color(0xFFFC8D33),
    Color(0xFFED4A57),
    Color(0xFFD1086A),
    Color(0xFFA208BA),
  ];
  static const List<Color> colors2 = [
    Color(0xFFED0014),
    Color(0xFFEC858E),
    Color(0xFFFFD3D4),
    Color(0xFFFEDBB3),
    Color(0xFFFFC482),
    Color(0xFFD29046),
    Color(0xFF99643A),
    Color(0xFF432324),
    Color(0xFF1C4928),
  ];
  static const List<Color> colors3 = [
    Color(0xFF262626),
    Color(0xFF363636),
    Color(0xFF555555),
    Color(0xFF737373),
    Color(0xFF999999),
    Color(0xFFB2B2B2),
    Color(0xFFC7C7C7),
    Color(0xFFDBDBDB),
    Color(0xFFEFEFEF),
  ];
}

/// [MadColorPicker]
class MadColorPicker extends StatelessWidget {
  /// [color] use for initial color basically [Colors.white]
  final Color selectedColor;

  /// [onColorSelected] function happens after picking a color
  final Function(Color?)? onColorSelected;

  final IconData iconData;

  const MadColorPicker({
    Key? key,
    this.selectedColor = Colors.white,
    this.iconData = Icons.colorize,
    this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_correctSizes);
    print(selectedColor);
    return Container(
      padding: const EdgeInsets.all(0.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SelectedColor(
              iconData: iconData,
              selectedColor: selectedColor,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 52,
              child: PageView(
                controller: PageController(
                  initialPage: 0,
                  keepPage: true,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: createColors(context, ColorsConstant.colors1),
                  ),
                  Row(
                    children: createColors(context, ColorsConstant.colors2),
                  ),
                  Row(
                    children: createColors(context, ColorsConstant.colors3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// create colors list item with safe width size.
  List<Widget> createColors(BuildContext context, List<Color> colors) {
    double size = _correctSizes[colors.length] ??
        _correctButtonSize(colors.length, MediaQuery.of(context).size.width);
    if (colors.length > 9) {}
    return [
      for (var color in colors)
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(size * 0.1),
            child: AnimatedContainer(
              width: size,
              height: size,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                    width: color == selectedColor ? 4 : 2, color: Colors.white),
                boxShadow: [
                  BoxShadow(blurRadius: size * 0.1, color: Colors.black)
                ],
              ),
            ),
          ),
          onTap: () => onColorSelected!.call(color),
        )
    ];
  }

  double _correctButtonSize(int itemSize, double screenWidth) {
    bool isSizeSafe = false;
    double initialSize = 52;
    double maxWidth = screenWidth - initialSize;
    double finalSize = 48;

    do {
      finalSize -= 2;
      double eachSize = finalSize * 1.2;
      double buttonArea = itemSize * eachSize;
      isSizeSafe = maxWidth > buttonArea;
    } while (!isSizeSafe);
    _correctSizes[itemSize] = finalSize;
    return finalSize;
  }
}

/// [SelectedColor] widget
class SelectedColor extends StatelessWidget {
  final Color selectedColor;
  final IconData? iconData;

  const SelectedColor({Key? key, required this.selectedColor, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: selectedColor,
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.white),
        boxShadow: const [BoxShadow(blurRadius: 0, color: Colors.black38)],
      ),
      child: iconData != null
          ? Icon(
              iconData,
              color: (selectedColor.computeLuminance() > 0.5)
                  ? Colors.black
                  : Colors.white,
            )
          : null,
    );
  }
}
