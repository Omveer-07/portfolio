import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SectionLayout extends StatelessWidget {
  const SectionLayout({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    required this.isMobile,
    this.horizontalPadding = 60,
    this.verticalPadding = 40,
    this.maxWidth = 1100,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.titleSpacing = 12,
    this.contentSpacing = 32,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final bool isMobile;
  final double horizontalPadding;
  final double verticalPadding;
  final double maxWidth;
  final CrossAxisAlignment crossAxisAlignment;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final double titleSpacing;
  final double contentSpacing;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (title != null || subtitle != null) {
      if (title != null) {
        children.add(
          Text(
            title!,
            style:
                titleTextStyle ??
                const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
          ),
        );
      }

      if (subtitle != null) {
        if (title != null) {
          children.add(SizedBox(height: titleSpacing));
        }
        children.add(
          Text(
            subtitle!,
            style:
                subtitleTextStyle ??
                const TextStyle(fontSize: 16, color: AppColors.textSecondary),
          ),
        );
      }

      if (title != null || subtitle != null) {
        children.add(SizedBox(height: contentSpacing));
      }
    }

    children.add(child);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 16,
    this.color,
    this.borderColor,
    this.borderWidth = 1,
    this.width,
    this.height,
    this.onTap,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? color;
  final Color? borderColor;
  final double borderWidth;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.card,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      clipBehavior: clipBehavior,
      child: child,
    );

    if (onTap == null) {
      return card;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: card,
    );
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.padding,
    this.textStyle,
    this.borderColor,
  });

  final String label;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor ?? AppColors.primary),
      ),
      child: Text(
        label,
        style:
            textStyle ??
            const TextStyle(fontSize: 11, color: AppColors.textPrimary),
      ),
    );
  }
}
