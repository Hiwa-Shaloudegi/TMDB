import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/main/cubit/main_cubit.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.isEnabled = true,
    this.controller,
  });

  final bool isEnabled;
  final TextEditingController? controller;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      child: SizedBox(
        height: 45,
        child: Center(
          child: GestureDetector(
            onTap: () => context.read<MainCubit>().changeNavIndex(1),
            child: TextField(
              controller: widget.controller,
              // onTap: () {
              //   ref.read(navIndexValueProvider.notifier).state = 1;
              // },
              // TODO: fix auto focus
              // autofocus: widget.isEnabled,
              decoration: InputDecoration(
                enabled: widget.isEnabled,
                hintText: "Search",
                hintStyle: textTheme.labelMedium,
                suffixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
                filled: true,
                fillColor: AppColors.textFieldBgDark,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 2,
                  bottom: 2,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.secondary),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
