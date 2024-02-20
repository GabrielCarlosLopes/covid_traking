import 'package:flutter/material.dart';

class HeaderRegionDetails extends StatelessWidget {
  const HeaderRegionDetails({
    super.key,
    required this.name,
    required this.urlImage,
    required this.state,
    required this.totalCases,
    required this.x,
  });

  final String name;
  final String urlImage;
  final String state;
  final String totalCases;
  final String x;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: name,
          child: Image.network(
            urlImage,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error_rounded);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Estado: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: state,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ])),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Casos totals: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          )),
                      TextSpan(
                        text: totalCases,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/x.png',
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(x)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
