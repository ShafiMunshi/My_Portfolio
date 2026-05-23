import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SkillData {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;

  const SkillData({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
  });
}

class HomeDescription extends StatelessWidget {
  const HomeDescription({super.key});

  final List<SkillData> skills = const [
    SkillData(
      icon: Icons.layers_outlined,
      title: 'Design Patterns',
      description:
          'I have Knowledge of MVP (Model-View-Presenter), MVVM (Model-View-ViewModel), or Clean Architecture.',
      iconColor: Color(0xFF00FF88),
    ),
    SkillData(
      icon: Icons.widgets_outlined,
      title: 'Core Concepts',
      description:
          'I have understanding of fundamental concepts like activity lifecycle, Widgets, UI design principles, data storage, networking, and threading.',
      iconColor: Color(0xFF00FF88),
    ),
    SkillData(
      icon: Icons.show_chart,
      title: 'Problem-Solving',
      description:
          'I can think critically and come up with innovative solutions to complex problems.I\'ve identified bottlenecks,improved app performance,or implemented creative solutions',
      iconColor: Color(0xFF00FF88),
    ),
    SkillData(
      icon: Icons.rocket_launch_outlined,
      title: 'Projects',
      description:
          'On Play Store and App Store, i have some live apps, maximum apps were made by a single company(MAAC), but those apps are used by ERP customers, etc',
      iconColor: Color(0xFF00FF88),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.insets.padding, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Better App,\nBetter Experience",
                    textAlign: TextAlign.left,
                    style: context.textStyles.titleSmBold
                        .copyWith(color: AppColors.green)),
                GestureDetector(
                    onTap: () {
                      // For web, open the PDF in a new tab for download
                      // https://drive.google.com/file/d/1fy8F9e9T2Q6XFmWWtlYUZAshPu6gdZOt/view?usp=sharing
                      launchUrlString(
                        'https://drive.google.com/uc?export=download&id=1fy8F9e9T2Q6XFmWWtlYUZAshPu6gdZOt',
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.green, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.download, color: AppColors.green),
                          Text(
                            'Download CV',
                            style: context.textStyles.titleSmBold.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Gap(15),
          context.isDesktopOrTablet
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills
          .map((skill) => Expanded(
                child: _buildSkillCard(context, skill),
              ))
          .toList(),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: skills
          .map((skill) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _buildSkillCard(context, skill),
              ))
          .toList(),
    );
  }

  Widget _buildSkillCard(BuildContext context, SkillData skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: skill.iconColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  skill.icon,
                  color: skill.iconColor,
                  size: 24,
                ),
              ),
              Gap(12),
              Expanded(
                child: SeoTexts(
                  text: skill.title,
                  style: context.textStyles.titleLgBold.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          Gap(16),
          SeoTexts(
            text: skill.description,
            style: context.textStyles.bodyMdMedium.copyWith(
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
                fontSize: 12),
            maxLines: context.isDesktopOrTablet ? 6 : null,
            overflow: context.isDesktopOrTablet ? TextOverflow.ellipsis : null,
          ),
        ],
      ),
    );
  }
}
