import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/search_user_list_model.dart';

class GlistTileWidget extends StatelessWidget {
  const GlistTileWidget({
    super.key,
    required this.item,
  });
  final UserItem item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        onTap: () async {
          await launchUrl(Uri.parse(item.htmlUrl));
        },
        leading: item.avatarUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(item.avatarUrl))
            : const Icon(Icons.person_3_outlined),
        title: Text(
          item.login,
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
