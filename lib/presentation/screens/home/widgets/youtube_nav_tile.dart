
import 'package:flutter/material.dart';


class YoutubeNavTile extends StatelessWidget {
  const YoutubeNavTile({super.key, required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 8,),
            Expanded(child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),)),
            Icon(Icons.chevron_right_rounded, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
