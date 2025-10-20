import 'package:car_rent/core/utils/color.dart';
import 'package:car_rent/core/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Find Your Dream Car',
      description: 'Explore our wide range of premium cars available for rent',
      image: AppImages.carOnboarding1,
    ),
    OnboardingData(
      title: 'Easy Booking Process',
      description: 'Book your favorite car in just a few simple steps',
      image: AppImages.carOnboarding2,
    ),
    OnboardingData(
      title: 'Enjoy Your Journey',
      description: 'Start your adventure with comfort and style',
      image: AppImages.carOnboarding4,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          final page = _pages[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              // Full-screen image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(page.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gradient overlay for better readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),

              // Content at bottom
              Positioned(
                left: 24,
                right: 24,
                bottom: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Text(
                        page.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        page.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Page indicator
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.black54,
                        dotColor: Colors.white.withOpacity(0.3),
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (index < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColrs.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          index < _pages.length - 1 ? 'Next' : 'Get Started',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Skip button (top right)
              if (index < _pages.length - 1)
                Positioned(
                  top: 50,
                  right: 20,
                  child: FadeIn(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;

  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}
