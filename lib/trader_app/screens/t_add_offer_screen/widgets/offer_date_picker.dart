import 'package:flutter/material.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/customer_number_picker.dart';

class OfferDatePicker extends StatelessWidget {
  final int hours;
  final int days;
  final int months;
  final Function(int hours) setHours;
  final Function(int days) setDays;
  final Function(int months) setMonths;
  const OfferDatePicker({
    super.key,
    required this.hours,
    required this.days,
    required this.months,
    required this.setHours,
    required this.setDays,
    required this.setMonths,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNumberPicker(
          onChanged: setHours,
          maxValue: 24,
          minValue: 0,
          value: hours,
          title: 'ساعة',
        ),
        CustomNumberPicker(
          onChanged: setDays,
          maxValue: 29,
          minValue: 0,
          value: days,
          title: 'يوم',
        ),
        CustomNumberPicker(
          onChanged: setMonths,
          maxValue: 5 * 12,
          minValue: 0,
          value: months,
          title: 'شهر',
        ),
      ],
    );
  }
}
