import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;

  GestureDetector _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available
          ? dayColor ?? Theme.of(context).colorScheme.secondary
          : dayColor?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      fontSize: shrink ? 14 : 28,
      fontWeight: FontWeight.w600,
    );
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: shrink ? 14 : 32,
      fontWeight: FontWeight.bold,
      height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                const Color(0xFF0DD8FF).withOpacity(0.3),
                const Color(0xFF0FABFF).withOpacity(0.3),
                const Color(0xFF1457FF).withOpacity(0.3),
                const Color(0xFF1636FF).withOpacity(0.3),
              ],
            ),
                borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).splashColor,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 0.5)
              ),
            ]
              )
            : BoxDecoration(color: Theme.of(context).focusColor, borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
              color: Theme.of(context).splashColor,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.5)
          ),
        ]),
        height: shrink ? 40 : 90,
        width: shrink ? 33 : 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              Text(
                shortName,
                style: TextStyle(
                  color: isSelected ? Colors.black:Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: shrink ? 12 : 14,
                ),
              ),
            const SizedBox(height: 15.0,),
            Text(
              dayNumber.toString(),
              style: isSelected ? selectedStyle : textStyle,
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    final dot = Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: dotsColor ?? activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [dot, dot],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
