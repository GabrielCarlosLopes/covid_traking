import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

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
                  child: NotesWidgets(notes: notes),
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
