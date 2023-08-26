import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class InterestsButton extends StatefulWidget {
  final Function(bool) onSelected;
  final bool selectionComplete;
  const InterestsButton({
    Key? key,
    required this.interest,
    required this.onSelected,
    required this.selectionComplete,
  }) : super(key: key);

  final String interest;

  @override
  State<InterestsButton> createState() => _InterestsButtonState();
}

class _InterestsButtonState extends State<InterestsButton> {
  bool _isSelected = false;
  void _onTap() {
    if (widget.selectionComplete && !_isSelected) return;
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelected(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size24,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isSelected ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}
