import 'package:barber_booking/widget/services_grid.dart';
import 'package:flutter/material.dart';

class BuildHomeGrid{
  Widget buildHomeGrid() {
    return Column(
      children: [
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
    );
  }
}