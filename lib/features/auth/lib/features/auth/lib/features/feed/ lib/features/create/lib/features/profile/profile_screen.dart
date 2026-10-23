import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.settings))]),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 12),
          const Text('Maaz Hassan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('@maaz_quantum', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Column(children: [Text('120', style: TextStyle(fontWeight: FontWeight.bold)), Text('Posts')]), Column(children: [Text('5.2K', style: TextStyle(fontWeight: FontWeight.bold)), Text('Followers')]), Column(children: [Text('340', style: TextStyle(fontWeight: FontWeight.bold)), Text('Following')])]),
          const SizedBox(height: 20),
          const Divider(),
          Expanded(child: GridView.builder(padding: const EdgeInsets.all(8), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4), itemCount: 15, itemBuilder: (c,i) => Container(color: Colors.grey[300], child: const Icon(Icons.image)))),
        ],
      ),
    );
  }
}
