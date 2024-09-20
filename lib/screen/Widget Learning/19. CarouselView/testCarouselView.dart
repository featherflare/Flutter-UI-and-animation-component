import 'package:flutter/material.dart';

class TestCarouselView extends StatefulWidget {
  const TestCarouselView({super.key});

  @override
  State<TestCarouselView> createState() => _TestCarouselViewState();
}

class _TestCarouselViewState extends State<TestCarouselView> {
  CarouselController controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Test 1'),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: CarouselView(
                itemSnapping: true,
                controller: controller,
                itemExtent: 330,
                shrinkExtent: 200,
                children: List<Widget>.generate(20, (int index) {
                  return UncontainedLayoutCard(
                      index: index, label: 'Item $index');
                }),
              ),
            ),
            const Text('Test 2'),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400, maxWidth: 300),
              child: CarouselView(
                scrollDirection: Axis.vertical,
                itemSnapping: true,
                controller: controller,
                itemExtent: 330,
                shrinkExtent: 200,
                children: List<Widget>.generate(20, (int index) {
                  return UncontainedLayoutCard(
                      index: index, label: 'Item $index');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: SizedBox(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage('assets/images/watch-2.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
