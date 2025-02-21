import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/constants.dart';
import '../data/coins_repository.dart';
import '../data/onboard_repository.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/appbar.dart';
import '../widgets/svg_widget.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nickname = context.read<OnboardRepository>().getNickname();
    final photo = context.read<OnboardRepository>().getPhoto();
    final scores = context.read<CoinsRepository>().getScores();

    return AppScaffold(
      body: Column(
        children: [
          Appbar(title: 'Leaderboard'),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: scores.length,
              itemBuilder: (context, index) {
                return _ScoreCard(
                  index: index + 1,
                  nickname: nickname,
                  photo: photo,
                  coins: scores[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({
    required this.index,
    required this.nickname,
    required this.photo,
    required this.coins,
  });

  final int index;
  final String nickname;
  final String photo;
  final String coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(
            index.toString().padLeft(2, '0'),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppFonts.bold,
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.file(
              File(photo),
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgWidget(
                  photo,
                  width: 32,
                );
              },
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              nickname,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.lemon,
              ),
            ),
          ),
          SvgWidget(Assets.coin),
          SizedBox(width: 4),
          Text(
            coins.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppFonts.bold,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
