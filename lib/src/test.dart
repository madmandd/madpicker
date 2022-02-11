// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Constants {
//   static const List<Color> colors1 = [
//     Color(0xFFFFFFFF),
//     Color(0xFF000000),
//     Color(0xFF3897F1),
//     Color(0xFF70C04F),
//     Color(0xFFFDCB5C),
//     Color(0xFFFC8D33),
//     Color(0xFFED4A57),
//     Color(0xFFD1086A),
//     Color(0xFFA208BA),
//   ];
//   static const List<Color> colors2 = [
//     Color(0xFFED0014),
//     Color(0xFFEC858E),
//     Color(0xFFFFD3D4),
//     Color(0xFFFEDBB3),
//     Color(0xFFFFC482),
//     Color(0xFFD29046),
//     Color(0xFF99643A),
//     Color(0xFF432324),
//     Color(0xFF1C4928),
//   ];
//   static const List<Color> colors3 = [
//     Color(0xFF262626),
//     Color(0xFF363636),
//     Color(0xFF555555),
//     Color(0xFF737373),
//     Color(0xFF999999),
//     Color(0xFFB2B2B2),
//     Color(0xFFC7C7C7),
//     Color(0xFFDBDBDB),
//     Color(0xFFEFEFEF),
//   ];

//   static const List<IconData> icon1 = [
//     Icons.cottage,
//     Icons.cottage,
//     Icons.cottage_outlined,
//     Icons.monetization_on,
//     Icons.cottage,
//     Icons.cottage_outlined,
//     Icons.monetization_on,
//   ];
// }

// final Map<int, double> _correctSizes = {};
// final PageController pageController = PageController(keepPage: true);

// class MadColorPicker extends StatelessWidget {
//   final Color selectedColor;
//   final IconData selectedIcon;
//   final bool isColorPicker;
//   final IconData? iconData;
//   final Function(Color)? onColorSelected;
//   final Function(IconData)? onIconDataSelected;

//   const MadColorPicker({
//     Key? key,
//     this.selectedColor = Colors.white,
//     this.selectedIcon = Icons.monetization_on,
//     this.iconData,
//     this.onColorSelected,
//     this.onIconDataSelected,
//     this.isColorPicker = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           isColorPicker
//               ? Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: SelectedColor(
//                         iconData: iconData,
//                         selectedColor: selectedColor,
//                       ),
//                     ),
//                     Expanded(
//                       child: SizedBox(
//                         height: 52,
//                         child: PageView(
//                           controller: pageController,
//                           physics: const BouncingScrollPhysics(),
//                           children: [
//                             Row(
//                               children:
//                                   createColors(context, Constants.colors1),
//                             ),
//                             Row(
//                               children:
//                                   createColors(context, Constants.colors2),
//                             ),
//                             Row(
//                               children:
//                                   createColors(context, Constants.colors3),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               : Row(children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: SelectedIcon(
//                       selectedIconData: selectedIcon,
//                     ),
//                   ),
//                   Expanded(
//                     child: SizedBox(
//                       height: 52,
//                       child: PageView(
//                         controller: pageController,
//                         physics: const BouncingScrollPhysics(),
//                         children: [
//                           Row(
//                             children: createIcons(context, Constants.icon1),
//                           ),
//                           Row(
//                             children: createIcons(context, Constants.icon1),
//                           ),
//                           Row(
//                             children: createIcons(context, Constants.icon1),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//           SmoothPageIndicator(
//             controller: pageController,
//             count: 3,
//             effect: const ScrollingDotsEffect(
//               spacing: 3,
//               activeDotColor: Colors.white,
//               dotColor: Colors.white24,
//               dotHeight: 8,
//               dotWidth: 8,
//               activeDotScale: 1,
//             ),
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> createIcons(BuildContext context, List<IconData> iconDatas) {
//     double size = _correctSizes[iconDatas.length] ??
//         correctButtonSize(iconDatas.length, MediaQuery.of(context).size.width);
//     return [
//       for (var ic in iconDatas)
//         GestureDetector(
//           child: Padding(
//             padding: EdgeInsets.all(size * 0.1),
//             child: AnimatedContainer(
//               height: size,
//               width: size,
//               duration: const Duration(milliseconds: 100),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 border: Border.all(width: 4, color: Colors.white),
//               ),
//               child: Icon(ic),
//             ),
//           ),
//           onTap: () => onIconDataSelected!.call(ic),
//         ),
//     ];
//   }

//   List<Widget> createColors(BuildContext context, List<Color> colors) {
//     double size = _correctSizes[colors.length] ??
//         correctButtonSize(colors.length, MediaQuery.of(context).size.width);
//     return [
//       for (var c in colors)
//         GestureDetector(
//           child: Padding(
//             padding: EdgeInsets.all(size * 0.1),
//             child: AnimatedContainer(
//               width: size,
//               height: size,
//               duration: const Duration(milliseconds: 100),
//               decoration: BoxDecoration(
//                 color: c,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   width: c == selectedColor ? 4 : 2,
//                   color: Colors.white,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: size * 0.1,
//                     color: Colors.black12,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           onTap: () => onColorSelected!.call(c),
//         )
//     ];
//   }

//   double correctButtonSize(int itemSize, double screenWidth) {
//     double firstSize = 52;
//     double maxWidth = screenWidth - firstSize;
//     bool isSizeOkay = false;
//     double finalSize = 48;

//     do {
//       finalSize -= 2;
//       double eachSize = finalSize * 1.2;
//       double buttonArea = itemSize * eachSize;
//       isSizeOkay = maxWidth > buttonArea;
//     } while (!isSizeOkay);
//     _correctSizes[itemSize] = finalSize;
//     return finalSize;
//   }
// }

// class SelectedIcon extends StatelessWidget {
//   final IconData? selectedIconData;
//   const SelectedIcon({Key? key, this.selectedIconData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 36,
//       height: 36,
//       child: selectedIconData != null
//           ? Icon(
//               selectedIconData,
//               color: Colors.black,
//             )
//           : null,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         border: Border.all(width: 2, color: Colors.white),
//         boxShadow: const [
//           BoxShadow(blurRadius: 0, color: Colors.black38),
//         ],
//       ),
//     );
//   }
// }

// class SelectedColor extends StatelessWidget {
//   final Color selectedColor;
//   final IconData? iconData;

//   const SelectedColor({Key? key, required this.selectedColor, this.iconData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 36,
//       height: 36,
//       child: iconData != null
//           ? Icon(
//               iconData,
//               color: selectedColor.computeLuminance() > 0.5
//                   ? Colors.black
//                   : Colors.white,
//             )
//           : null,
//       decoration: BoxDecoration(
//         color: selectedColor,
//         shape: BoxShape.circle,
//         border: Border.all(width: 2, color: Colors.white),
//         boxShadow: const [
//           BoxShadow(blurRadius: 0, color: Colors.black38),
//         ],
//       ),
//     );
//   }
// }
