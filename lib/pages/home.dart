import 'package:barber_booking/widget/services_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Mostafiz Emon",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Services",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServicesGrid(
                    imagepath: "assets/images/classic_shaving.png",
                    servicename: "Classic Shaving",
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ServicesGrid(
                    imagepath: "assets/images/hair_washing.png",
                    servicename: "Hair Washing",
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServicesGrid(
                    imagepath: "assets/images/hair_cutting.png",
                    servicename: "Hair Cutting",
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ServicesGrid(
                    imagepath: "assets/images/beard_trimming.png",
                    servicename: "Beard Trimming",
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServicesGrid(
                    imagepath: "assets/images/facial.png",
                    servicename: "Facials",
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ServicesGrid(
                    imagepath: "assets/images/kids_haircut.png",
                    servicename: "Kids HairCutting",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
