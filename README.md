# MadPicker

## Todo 

- [x]  color picker
- [x]  icon picker  




```dart
List<Widget> CreateIcons(BuildContext context, List<IconData> iconDatas, onIconDataSelected) {

  double correctButtonSize(int itemSize, double screenWidth) {
    double firstSize = 52;
    double maxWidth = screenWidth - firstSize;
    bool isSizeOkay = false;
    double finalSize = 48;

    do {
      finalSize -= 2;
      double eachSize = finalSize * 1.2;
      double buttonArea = itemSize * eachSize;
      isSizeOkay = maxWidth > buttonArea;
    } while (!isSizeOkay);
    _correctSizes[itemSize] = finalSize;
    return finalSize;
  }
    double size = _correctSizes[iconDatas.length] ??
        correctButtonSize(iconDatas.length, MediaQuery.of(context).size.width);
    return [
      for (var ic in iconDatas)
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(size * 0.1),
            child: AnimatedContainer(
              height: size,
              width: size,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Colors.white),
              ),
              child: Icon(ic),
            ),
          ),
          onTap: () => onIconDataSelected.call(ic),
        ),
    ];
  }

```