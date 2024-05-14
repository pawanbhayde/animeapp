// ignore_for_file: file_names

import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

class HomePageBannerAnimeWidget extends StatelessWidget {
  const HomePageBannerAnimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShadowOverlay(
          shadowHeight: 200,
          shadowWidth: 400,
          shadowColor: AppPallete.backgroundColor,
          child: Image.asset(
            'assets/demon.png',
            fit: BoxFit.cover,
            height: 400,
            width: 400,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: const Alignment(0.0, 0.4),
                begin: const Alignment(0.0, -1),
                colors: <Color>[
                  const Color(0x8A000000),
                  Colors.black12.withOpacity(0.0)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppPallete.whiteColor,
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: AppPallete.whiteColor,
            ),
          ),
        ),
        // center column for the title and subtitle and play and add to list buttons
        Positioned(
          bottom: 20,
          left: 40,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Demon Slayer',
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 10),
              const Text(
                'Kimetsu no Yaiba',
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow,
                        color: AppPallete.backgroundColor),
                    label: const Text('Play',
                        style: TextStyle(color: AppPallete.backgroundColor)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: AppPallete.whiteColor),
                    label: const Text(
                      'My List',
                      style: TextStyle(color: AppPallete.whiteColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      side: const BorderSide(color: AppPallete.whiteColor),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
