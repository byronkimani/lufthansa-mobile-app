import 'package:flutter/material.dart';
import 'package:lufthansa/data/constants/asset_strings.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage(pageNotFoundImage)),
          const SizedBox(height: 30),
          const Text(
            'Sorry an error occurred and we could not find what you were looking for',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.width * 0.3,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Go back',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
