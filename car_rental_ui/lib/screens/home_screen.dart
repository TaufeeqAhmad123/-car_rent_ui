import 'dart:ui';

import 'package:car_rent/core/utils/color.dart';
import 'package:car_rent/core/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> categories = [
    'SUV',
    'Sedan',
    'Convertible',
    'Hatchback',
    'Coupe',
    'Truck',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container with rounded bottom corners

            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColrs.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Row with profile, location, and icon
                    const SizedBox(
                      height: 20,
                    ),
                    topRowWidget(),

                    const SizedBox(height: 24),

                    // First text
                    FadeInLeft(
                      duration: const Duration(milliseconds: 700),
                      delay: const Duration(milliseconds: 400),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hello, Welcome Back!',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Second text
                    FadeInLeft(
                      duration: const Duration(milliseconds: 700),
                      delay: const Duration(milliseconds: 500),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Find Your Dream Car',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Search bar
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for cars...',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                            suffixIcon: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2196F3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Content section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories
                  const textWidget(title: 'Top Brands', actionText: 'see all'),

                  const SizedBox(height: 16),

                  // Category cards
                  SlideInUp(
                    duration: const Duration(milliseconds: 700),
                    delay: const Duration(milliseconds: 800),
                    child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected = _currentIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              child: _categorybuild(isSelected, index),
                            );
                          },
                        )),
                  ),

                  const SizedBox(height: 24),

                  // Popular cars section
                  const textWidget(
                      title: 'Available near you', actionText: 'see all'),

                  const SizedBox(height: 8),

                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _availableCard();
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Navigation Bar
      floatingActionButton: FadeInUp(
        duration: const Duration(milliseconds: 800),
        delay: const Duration(milliseconds: 1200),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 0),
              const SizedBox(width: 20),
              _buildNavItem(Icons.search, 1),
              const SizedBox(width: 20),
              _buildNavItem(Icons.favorite_outline, 2),
              const SizedBox(width: 20),
              _buildNavItem(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container _availableCard() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 300,
      width: 250,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AppImages.carOnboarding1), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
              top: 10,
              right: 20,
              child: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppColrs.primary.withOpacity(0.7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Silver BMW M8 2025',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("\$250/day",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        _specbuild('petrol', Icons.star),
                        const SizedBox(width: 8),
                        _specbuild('automatic', Icons.settings),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _specbuild(final String specText, final IconData specIcon) {
    return Expanded(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColrs.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(specIcon, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(specText,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                )),
          ],
        ),
      ),
    ));
  }

  Container _categorybuild(bool isSelected, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColrs.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.black87,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            categories[index],
            style: GoogleFonts.lato(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(isSelected ? 12 : 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2196F3) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 28,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(String name, String type, String price, double rating) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.directions_car,
              size: 40,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Rent',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class textWidget extends StatelessWidget {
  final String title, actionText;
  const textWidget({
    super.key,
    required this.title,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      delay: const Duration(milliseconds: 700),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Spacer(),
          Text(
            actionText,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColrs.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}

class topRowWidget extends StatelessWidget {
  const topRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      duration: const Duration(milliseconds: 700),
      delay: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Color(0xFF2196F3),
              size: 30,
            ),
          ),

          // Location in middle
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current Location',
                      style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white.withOpacity(0.9),
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Los Angeles, California',
                      style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColrs.buttonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
