import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalDatePicker extends StatefulWidget {
  const HorizontalDatePicker({
    super.key,
    required this.startDate,
    this.days = 14,
    this.selectedDate,
    this.onDateSelected,
  });

  final DateTime startDate;
  final int days;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<HorizontalDatePicker> createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    _selected =
        widget.selectedDate ??
        (widget.startDate.isBefore(DateTime.now()) &&
                widget.startDate
                    .add(Duration(days: widget.days - 1))
                    .isAfter(DateTime.now())
            ? DateTime.now()
            : widget.startDate);
    _selected = _stripTime(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: widget.days,
      itemBuilder: (_, i) {
        final date = _stripTime(widget.startDate.add(Duration(days: i)));
        final bool isPicked = _isSameDay(date, _selected);

        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              setState(() => _selected = date);
              widget.onDateSelected?.call(date);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70,
                  height: 90,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: isPicked ? const Color(0xFFE6FFF2) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isPicked
                          ? const Color(0xFF00804A)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('E').format(date),
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isPicked
                              ? const Color(0xFF006030)
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        DateFormat('dd').format(date),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: isPicked
                              ? const Color(0xFF006030)
                              : Colors.grey.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildDots(calEvents[date] ?? const <Color>[]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  DateTime _stripTime(DateTime d) => DateTime(d.year, d.month, d.day);

  List<Widget> _buildDots(List<Color> colours) {
    if (colours.isEmpty) return const [SizedBox.shrink()];
    return [
      for (var i = 0; i < colours.length; i++)
        Padding(
          padding: EdgeInsets.only(right: i == colours.length - 1 ? 0 : 4),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: colours[i],
              shape: BoxShape.circle,
            ),
          ),
        ),
    ];
  }
}

final calEvents = <DateTime, List<Color>>{
  DateTime(2025, 8, 2): [Colors.blue, Colors.orange],
  DateTime(2025, 8, 3): [Colors.teal],
  DateTime(2025, 8, 4): [Colors.teal, Colors.blue, Colors.orange],
  DateTime(2025, 8, 5): [Colors.teal, Colors.orange],
};
