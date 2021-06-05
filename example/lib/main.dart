import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Image Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Parallax Image Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Horizontal scroll parallax',
              style: theme.textTheme.subtitle1,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            constraints: const BoxConstraints(maxHeight: 200.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildHorizontalChild,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Vertical scroll parallax',
              style: theme.textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: _buildVerticalChild,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          print('Tapped $index');
        },
        child: ParallaxImage(
          extent: 150.0,
          image: ExactAssetImage(
            'images/img$index.jpg',
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ParallaxImage(
        extent: 100.0,
        image: ExactAssetImage(
          'images/img$index.jpg',
        ),
      ),
    );
  }
}
