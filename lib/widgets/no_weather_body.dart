import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text('there is no weather 😔 start ',
              style: TextStyle(
                  fontSize: 30,
              ),
            ),
            Text('searching now 🔍 ',
              style: TextStyle(
                  fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
