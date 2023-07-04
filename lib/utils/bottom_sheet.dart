import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/main_button.dart';

void showCustomBottomSheet(
  BuildContext context,
  String mainText,
  String secondText,
  String iconUrl,
  String buttonText,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        height: 400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 74),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        secondText,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      MainButton(
                        widget: Text(
                          buttonText,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        active: true,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0XFF333333),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconUrl,
                      width: 55,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showCustomBottomSheet2(
  BuildContext context,
  String mainText,
  String secondText,
  String iconUrl,
  String buttonText,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        height: 400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 74),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        secondText,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      MainButton(
                        widget: Text(
                          buttonText,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        active: true,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0XFF333333),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconUrl,
                      width: 55,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showCustomBottomSheet1(
  BuildContext context,
  String mainText,
  String secondText,
  String iconUrl,
  String buttonText,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        height: 400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 74),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        secondText,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      MainButton(
                        widget: Text(
                          buttonText,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        active: true,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0XFF333333),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconUrl,
                      width: 55,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
