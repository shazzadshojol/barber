import 'package:flutter/material.dart';
class Bookingdateandtime extends StatefulWidget {
  Size screensize;
  BuildContext context;
  Bookingdateandtime({super.key,required this.screensize, required this.context});

  @override
  State<Bookingdateandtime> createState() => _BookingdateandtimeState();
}

class _BookingdateandtimeState extends State<Bookingdateandtime> {
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: widget.screensize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                const Text(
                  "Set a Date",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: widget.screensize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                const Text(
                  "Set a Time",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: const Icon(
                          Icons.alarm,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      _selectedTime.format(context),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }

  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 6)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  TimeOfDay _selectedTime = const TimeOfDay(hour: 8, minute: 0);
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0), // Default time to show
    );

    if (pickedTime != null) {
      if (pickedTime.hour >= 8 && pickedTime.hour < 22) {
        setState(() {
          _selectedTime = pickedTime;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select a time between 8:00 AM and 10:00 PM."),
          ),
        );
      }
    }
  }
}


