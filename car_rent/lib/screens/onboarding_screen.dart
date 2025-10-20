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
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF2196F3), Color(0xFF1976D2), Color(0xFF0D47A1)],
      ),
      color: Colors.blue,
      icon: Icons.directions_car,
    ),
    OnboardingData(
      title: 'Easy Booking Process',
      description: 'Book your favorite car in just a few simple steps',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF9C27B0), Color(0xFF7B1FA2), Color(0xFF6A1B9A)],
      ),
      color: Colors.purple,
      icon: Icons.touch_app,
    ),
    OnboardingData(
      title: 'Enjoy Your Journey',
      description: 'Start your adventure with comfort and style',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF9800), Color(0xFFF57C00), Color(0xFFE65100)],
      ),
      color: Colors.orange,
      icon: Icons.explore,
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
      body: Stack(
        children: [
          // PageView with images and content
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(_pages[index], index);
            },
          ),

          // Bottom content with text, dot indicator and button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  FadeInUp(
                    key: ValueKey(_currentPage),
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      _pages[_currentPage].title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  FadeInUp(
                    key: ValueKey('${_currentPage}_desc'),
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      _pages[_currentPage].description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Dot Indicator
                  SlideInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 400),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: _pages[_currentPage].color,
                        dotColor: Colors.white.withOpacity(0.3),
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Button
                  BounceInUp(
                    duration: const Duration(milliseconds: 800),
                    delay: const Duration(milliseconds: 600),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage < _pages.length - 1) {
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
                          backgroundColor: _pages[_currentPage].color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          _currentPage < _pages.length - 1
                              ? 'Next'
                              : 'Get Started',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skip button
          if (_currentPage < _pages.length - 1)
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
      ),
    );
  }

  Widget _buildPage(OnboardingData data, int index) {
    return FadeIn(
      key: ValueKey(index),
      duration: const Duration(milliseconds: 800),
      child: Container(
        decoration: BoxDecoration(
          gradient: data.gradient,
        ),
        child: Center(
          child: ZoomIn(
            duration: const Duration(milliseconds: 1000),
            delay: const Duration(milliseconds: 400),
            child: Icon(
              data.icon,
              size: 200,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final Color color;
  final Gradient gradient;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.color,
    required this.gradient,
    required this.icon,
  });
}
