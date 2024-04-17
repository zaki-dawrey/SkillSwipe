import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/users/providers/users_notifier.dart';

class UserListView extends ConsumerWidget {
  const UserListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersNotifier = ref.watch(usersNotifierProvider);
    return usersNotifier.when(
      error: (err, _) => const Center(
        child: Text(
          'Error fetching User Data',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 20,
                child: Icon(
                  Icons.person,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data[index].username,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data[index].description,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          );
        },
      ),
    );
  }
}
