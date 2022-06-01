import 'package:flutter/material.dart';
import 'package:lufthansa/data/constants/asset_strings.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(cloudsImage),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    // letterSpacing: 1.25,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Where would you like to go today?',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
      expandedHeight: 150,
      titleSpacing: 30,
    );
  }
}
