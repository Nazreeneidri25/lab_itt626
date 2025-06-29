import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.currency_bitcoin, size: 80, color: Colors.amber),
            const SizedBox(height: 30),
            const Text(
              'Live XRP',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Live XRP is a simple and elegant app that provides real-time tracking of XRP to MYR exchange values. '
                  'It displays the latest bid, ask, and trade prices along with 24-hour volume — updated automatically from reliable sources.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 40),
            const Divider(thickness: 1.2),
            const SizedBox(height: 20),
            const Text(
              'Developed by',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'MUHAMMAD NAZREEN EIDRI MUDA MUDA ALANG @ SABRI',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
