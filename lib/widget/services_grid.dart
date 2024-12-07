import 'package:barber_booking/pages/booking.dart';
import 'package:flutter/material.dart';

class ServicesGrid extends StatefulWidget {
  String imagepath;
  String servicename;

  ServicesGrid({
    super.key,
    required this.imagepath,
    required this.servicename,
  });

  @override
  State<ServicesGrid> createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Booking(servicename: widget.servicename),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12.00),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagepath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.servicename,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
