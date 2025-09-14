import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vendor_app/helper/colors.dart';
import 'package:vendor_app/helper/common_appbar.dart';
import 'package:vendor_app/widgets/buttons.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyMedium;
    List<Subscription> subscriptionList = [
      Subscription(
          description:
              'Get started with essential features at an affordable price.',
          price: '30',
          title: 'Basic'),
      Subscription(
          description:
              'Unlock premium tools and advanced options for maximum efficiency.',
          price: '60',
          title: 'Silver'),
      Subscription(
          description:
              'Designed for businesses with extensive needs and custom solutions.',
          price: '70',
          title: 'Platinum')
    ];
    return CommonAppbar(
      title: 'Subscription',
      isDrawerRequired: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Choose the plan that's right for you.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "Start your journey with us today and experience the difference.Select a plan that fits your needs and get started with ease.!",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          CarouselSlider.builder(
            itemCount: subscriptionList.length,
            itemBuilder: (context, index, realIndex) {
              return PlanCard(
                title: subscriptionList[index].title ?? '',
                price: '\u{20B9} ${subscriptionList[index].price ?? ''}',
                description: subscriptionList[index].description ?? '',
                backgroundColor: Colors.black,
                priceColor: Colors.white,
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.vertical, // Vertical scrolling
              height: 400, // Adjust height as needed
              enlargeCenterPage: true, // Optional: Enlarges the center card
              autoPlay: false, // Optional: Disable auto play if not needed
            ),
          ),
          SizedBox(height: 10), // Space below the carousel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "No matter what your needs are, we have a plan that's perfect for you.",
              style: style?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final Color backgroundColor;
  final Color priceColor;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.backgroundColor,
    required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyMedium;
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: style?.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: style?.copyWith(color: Colors.white70),
          ),
          SizedBox(height: 16),
          Text(
            price,
            style: style?.copyWith(
                fontSize: 32, fontWeight: FontWeight.bold, color: priceColor),
          ),
          SizedBox(height: 16),
          CustomButton(height: 50, width: 150, label: 'Buy', onPress: () {})
        ],
      ),
    );
  }
}

class Subscription {
  final String? title;
  final String? price;
  final String? description;

  Subscription({
    this.title,
    this.price,
    this.description,
  });
}
