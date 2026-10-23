import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [Icon(Icons.bolt, color: Color(0xFF6C5CE7)), SizedBox(width: 8), Text('Quantum', style: TextStyle(fontWeight: FontWeight.bold))]),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.message_outlined)), IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined))],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(leading: CircleAvatar(child: Text('U$index')), title: Text('User $index'), subtitle: const Text('2h ago'), trailing: const Icon(Icons.more_horiz)),
                Container(height: 200, color: Colors.grey[300], child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey[600]))),
                Padding(padding: const EdgeInsets.all(12), child: Row(children: [const Icon(Icons.favorite_border), const SizedBox(width: 16), const Icon(Icons.chat_bubble_outline), const SizedBox(width: 16), const Icon(Icons.send_outlined), const Spacer(), const Icon(Icons.bookmark_border)])),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('This is quantum post! Amazing content here 🔥', style: TextStyle(fontWeight: FontWeight.w500))),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'), BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Create'), BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile')]),
    );
  }
}
