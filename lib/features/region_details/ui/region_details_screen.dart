import 'package:flutter/material.dart';

class RegionDetailsScreen extends StatelessWidget {
  final String name;
  final String state;
  final String urlImage;
  final String totalCases;
  final String x;
  final String notes;
  const RegionDetailsScreen({
    super.key,
    required this.name,
    required this.state,
    required this.urlImage,
    required this.totalCases,
    required this.x,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderRegionDetails(
                name: name,
                urlImage: urlImage,
                state: state,
                totalCases: totalCases,
                x: x,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(notes)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
