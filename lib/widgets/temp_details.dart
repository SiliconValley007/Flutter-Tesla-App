import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/home/home_controller.dart';
import 'widgets.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController homeController,
  })  : _homeController = homeController,
        super(key: key);

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  svgPath: 'assets/icons/coolShape.svg',
                  text: 'COOL',
                  isActive: _homeController.isCoolSelected,
                  onPressed: _homeController.toggleCoolSelected,
                ),
                const SizedBox(width: defaultPadding),
                TempButton(
                  svgPath: 'assets/icons/heatShape.svg',
                  text: 'HEAT',
                  activeColor: redColor,
                  isActive: !_homeController.isCoolSelected,
                  onPressed: _homeController.toggleCoolSelected,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              const Text(
                '29\u2103',
                style: TextStyle(
                  fontSize: 84,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'CURRENT TEMPERATURE',
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'INSIDE',
                  ),
                  Text(
                    '20\u2103',
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OUTSIDE',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '35\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}