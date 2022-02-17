import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/tyrepsi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isBottomTyre,
    required this.tyrePsi,
  }) : super(key: key);

  final bool isBottomTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        border: Border.all(
          color: tyrePsi.isLowPressure ? redColor : primaryColor,
          width: 2,
        ),
      ),
      child: isBottomTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tyrePsi.isLowPressure) const LowPressureText(),
                const Spacer(),
                PSI(
                  psi: '${tyrePsi.psi}',
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PSI(
                  psi: '${tyrePsi.psi}',
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                if (tyrePsi.isLowPressure) const LowPressureText(),
              ],
            ),
    );
  }
}

class LowPressureText extends StatelessWidget {
  const LowPressureText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'LOW',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        const Text(
          'PRESSURE',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class PSI extends StatelessWidget {
  const PSI({
    Key? key,
    required this.psi,
  }) : super(key: key);

  final String psi;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: const [
          TextSpan(
            text: "psi",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
