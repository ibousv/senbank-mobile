

import 'package:flutter/material.dart';
import 'package:senbank/src/ui/views/onboarding/landing_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPage(),
    );
  }
}
