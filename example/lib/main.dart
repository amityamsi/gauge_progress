import 'package:flutter/material.dart';
import 'package:gauge_progress/gauge_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const GaugeDashboard(),
    );
  }
}

class GaugeDashboard extends StatefulWidget {
  const GaugeDashboard({super.key});

  @override
  State<GaugeDashboard> createState() => _GaugeDashboardState();
}

class _GaugeDashboardState extends State<GaugeDashboard> {
  double percentage = 72;

  Widget buildCard(String title, Widget gauge) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          /// 👇 This prevents overflow
          Expanded(
            child: Center(child: gauge),
          ),
        ],
      ),
    );
  }

  Widget adaptiveGauge(GaugeType type, {Color? color, int segments = 12}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth * 0.8;

        return GaugeProgress(
          type: type,
          percentage: percentage,
          progressColor: color ?? Colors.blue,
          segments: segments,
          size: size,
          showText: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6FA),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Gauge Progress Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 900;

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(24),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWide ? 3 : 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return buildCard(
                            "Semi Circular",
                            adaptiveGauge(GaugeType.semiCircular),
                          );
                        case 1:
                          return buildCard(
                            "Full Circular",
                            adaptiveGauge(
                              GaugeType.fullCircular,
                              color: Colors.green,
                            ),
                          );
                        case 2:
                          return buildCard(
                            "Segmented",
                            adaptiveGauge(
                              GaugeType.segmented,
                              color: Colors.orange,
                              segments: 14,
                            ),
                          );
                        case 3:
                          return buildCard(
                            "Dashed",
                            adaptiveGauge(
                              GaugeType.dashed,
                              color: Colors.purple,
                            ),
                          );
                        case 4:
                          return buildCard(
                            "Speedometer",
                            adaptiveGauge(GaugeType.speedometer),
                          );
                        default:
                          return buildCard(
                            "Multi Range",
                            adaptiveGauge(GaugeType.multiRange),
                          );
                      }
                    },
                  ),
                ),

                /// Slider Section
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      const Text(
                        "Adjust Value",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: percentage,
                        min: 0,
                        max: 100,
                        onChanged: (value) =>
                            setState(() => percentage = value),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
