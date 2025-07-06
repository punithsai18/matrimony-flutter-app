import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Discover")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('User ${index + 1}'),
            subtitle: const Text('Age: 25 | Location: Chennai'),
            trailing: const Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }
}
