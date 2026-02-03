import 'package:flutter/cupertino.dart';

class DraggableToggleSwitch2 extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onToggleChanged;

  const DraggableToggleSwitch2({
    super.key,
    required this.initialValue,
    required this.onToggleChanged,
  });

  @override
  _DraggableToggleSwitchState createState() => _DraggableToggleSwitchState();
}

class _DraggableToggleSwitchState extends State<DraggableToggleSwitch2> {
  late double _positionX;
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue; 
    _positionX = isToggled ? 24.0 : 0.0;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _positionX = (_positionX + details.delta.dx).clamp(0.0, 24.0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      
      isToggled = _positionX >= 12;

      
      _positionX = isToggled ? 24.0 : 0.0;

      
      widget.onToggleChanged(isToggled);
      print("Toggle final value: $isToggled");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Container(
        width: 39,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(58),
          border: Border.all(
            color: const Color(0xFF064698),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: _positionX,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color(0xFFF2C22A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
