import 'package:evoq_healthcare_app/constants.dart';
import 'package:evoq_healthcare_app/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final VoidCallback press;

  const InfoCard({
    super.key,
    required this.title,
    required this.effectedNum,
    required this.iconColor,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: iconColor.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/running.svg",
                            height: 12,
                            width: 12,
                            colorFilter:
                                ColorFilter.mode(iconColor, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                  text: "$effectedNum \n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: "People",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: LineReportChart(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
