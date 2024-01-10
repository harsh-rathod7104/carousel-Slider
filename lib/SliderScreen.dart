import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final imageList = [
    {
      "id": "1",
      "image_path":
          "https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "3",
      "image_path":
          "https://images.pexels.com/photos/1107717/pexels-photo-1107717.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "4",
      "image_path":
          "https://images.pexels.com/photos/33041/antelope-canyon-lower-canyon-arizona.jpg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "5",
      "image_path":
          "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "6",
      "image_path":
          "https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "7",
      "image_path":
          "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "8",
      "image_path":
          "https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "id": "9",
      "image_path":
          "https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
  ];

  final CarouselController carouselController = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 137, 240),
      appBar: AppBar(
        title: const Text("Slider Example"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                child: CarouselSlider(
                  items: imageList
                      .map((item) => Image.network(
                            item["image_path"].toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ))
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 2),
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 400),
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < imageList.length; i++)
                buidIndicator(current == i),
            ],
          ),
        ],
      ),
    );
  }

  Widget buidIndicator(bool isSelecetd) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      duration: const Duration(milliseconds: 200),
      height: isSelecetd ? 8 : 6,
      width: isSelecetd ? 30 : 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelecetd ? Colors.red : Colors.black,
      ),
    );
  }
}
