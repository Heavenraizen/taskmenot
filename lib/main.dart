import 'package:flutter/material.dart';
import 'package:taskmenot/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Demo',
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == 2;
              });
            },
            children: const [
              OnboardingPage(
                image: 'assets/images/Slide1.png',
                title: 'Stay Organized,\nStay Productive',
                description: 'Keep track of your tasks effortlessly with Task Me Not. Create, edit, and manage your to-dos anytime, anywhere.',
                backgroundColor: Color(0xFFFBFBFB),
              ),
              OnboardingPage(
                image: 'assets/images/Slide2.png',
                title: 'Access Your Tasks \nAnytime',
                description: 'Your tasks are securely saved in the cloud, so you can log in from any device with the app.',
                backgroundColor: Color(0xFFC4D9FF),
              ),
              OnboardingPage(
                image: 'assets/images/Slide3.png',
                title: 'Set Reminders &\n Collaborate',
                description: 'Never miss a deadline with smart notifications, and share your lists with friends or teammates for seamless collaboration.',
                backgroundColor: Color(0xFFE8F9FF),
              ),
            ],
          ),

          // Dot indicator
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.black,
                ),
              ),
            ),
          ),

          // Show "Proceed to Login" only on last page
          if (onLastPage)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Proceed to Login",
                  style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Color(0xFF7960FF))),
                )
              ),
            ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
            style: TextStyle(
            fontSize: 30,
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w600,),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            image,
            height: 350,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'PlusJakartaSans',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
