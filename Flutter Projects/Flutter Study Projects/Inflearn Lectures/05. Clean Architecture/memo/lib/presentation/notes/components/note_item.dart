import 'package:flutter/material.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/ui/colors.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  // delete icon 클릭시 callback
  final Function? deleteIconTapped;

  const NoteItem({super.key, required this.note, this.deleteIconTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  note.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                deleteIconTapped?.call();
              },
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
