import 'package:flutter/material.dart';
import 'package:youtube/core/constants/app_colors.dart';
import 'package:youtube/core/constants/app_strings.dart';
import 'package:youtube/core/constants/youtube_urls.dart';
import 'package:youtube/presentation/screens/home/widgets/youtube_nav_tile.dart';
import 'package:youtube/presentation/screens/youtube/youtube_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openUrl(String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeScreen(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Row(
          children: [
            Container(
              width: 35,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.youtubePrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
            const SizedBox(width: 4),
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            _buildSectionHeader(AppStrings.sectionBrowse),
            Divider(height: 1, color: AppColors.textHint),
            YoutubeNavTile(
              icon: Icons.home,
              label: AppStrings.navHome,
              onTap: () => _openUrl(AppStrings.navHome, YoutubeUrls.home),
            ),
            YoutubeNavTile(
              icon: Icons.smart_display_outlined,
              label: AppStrings.navShorts,
              onTap: () => _openUrl(AppStrings.navShorts, YoutubeUrls.shorts),
            ),
            YoutubeNavTile(
              icon: Icons.subscriptions_rounded,
              label: AppStrings.navSubscriptions,
              onTap: () =>
                  _openUrl(AppStrings.navSubscriptions, YoutubeUrls.shorts),
            ),
            YoutubeNavTile(
              icon: Icons.explore,
              label: AppStrings.navExplore,
              onTap: () {},
            ),
            YoutubeNavTile(
              icon: Icons.trending_up,
              label: AppStrings.navTrending,
              onTap: () {},
            ),
            Divider(height: 1, color: AppColors.textHint),
            _buildSectionHeader(AppStrings.sectionLibrary),
            YoutubeNavTile(
              icon: Icons.history,
              label: AppStrings.navHistory,
              onTap: () {},
            ),
            YoutubeNavTile(
              icon: Icons.watch_later,
              label: AppStrings.navWatchLater,
              onTap: () {},
            ),
            YoutubeNavTile(
              icon: Icons.video_library,
              label: AppStrings.navLikedVideos,
              onTap: () {},
            ),
            Divider(height: 1, color: AppColors.textHint),
            _buildSectionHeader(AppStrings.sectionMore),
            YoutubeNavTile(
              icon: Icons.settings,
              label: AppStrings.navSettings,
              onTap: () {},
            ),
            YoutubeNavTile(
              icon: Icons.help_outline,
              label: AppStrings.navHelp,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
