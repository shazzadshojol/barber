import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/widget/bookingdateandtime.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  String servicename;

  Booking({super.key, required this.servicename});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (Route<dynamic> route) => false);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let's the\njourney begin",
                style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/barbershopbanner.png",
                width: screensize.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.servicename,
                style: const TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Bookingdateandtime(screensize: screensize, context: context),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: screensize.width,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                    child: Text(
                  "Book Now",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
