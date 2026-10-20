import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';

abstract final class AppStyles {
  // Light Theme
  static final TextStyle blackJakartaBoldBlack32 = GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaSemiBoldBlack20 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaRegularBlack20 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaSemiBoldBlack18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.45,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaSemiBoldDarkBlue18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.45,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackJakartaSemiBoldWhite18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.45,
    color: AppColors.wight,
  );

  static final TextStyle blackJakartaMediumDarkGrey18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaRegularDarkBlue18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackJakartaRegularBlack16 = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.45,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaSemiBoldBlack15 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaSemiBoldWhite15 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.wight,
  );

  static final TextStyle blackJakartaRegularBlack15 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.45,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaRegularBlack14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.14,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaRegularDarkGrey13_5 = GoogleFonts.plusJakartaSans(
    fontSize: 13.5,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaSemiBoldElectricBlue13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.electricBlue,
  );

  static final TextStyle blackJakartaRegularBlack13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaRegularDarkGrey13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaSemiBoldDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaMediumDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaRegularBlack12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static final TextStyle blackJakartaRegularDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackJakartaBoldElectricBlue11 = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.55,
    color: AppColors.electricBlue,
  );

  static final TextStyle blackJakartaBoldDarkBlue10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.4,
    color: AppColors.darkBlue,
  );


  static final TextStyle blackInterBoldBlack22 = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldBlack20 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.black,
  );

  static final TextStyle blackInterRegularBlack16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: AppColors.black,
  );

  static final TextStyle blackInterRegularCoolGray16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: AppColors.coolGray,
  );

  static final TextStyle blackInterItalicBlack16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    letterSpacing: -0.08,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldBlack15 = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.black,
  );

  static final TextStyle blackInterMediumDarkGrey14_5 = GoogleFonts.inter(
    fontSize: 14.5,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterBoldBlack14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldBlack14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldDarkBlue14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackInterSemiBoldDarkGrey14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterSemiBoldWhite14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.wight,
  );

  static final TextStyle blackInterRegularBlack14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static final TextStyle blackInterRegularDarkGrey14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterRegularDarkGrey13_5 = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterSemiBoldElectricBlue13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.electricBlue,
  );

  static final TextStyle blackInterRegularDarkGrey13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterRegularBlack12_5 = GoogleFonts.inter(
    fontSize: 12.5,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldBlack12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldDarkBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackInterSemiBoldDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterSemiBoldWhite12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.wight,
  );

  static final TextStyle blackInterMediumDarkBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackInterMediumRed12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
    color: AppColors.red,
  );

  static final TextStyle blackInterRegularDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterItalicBlack12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: AppColors.black,
  );

  static final TextStyle blackInterItalicDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterSemiBoldBlack10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.black,
  );

  static final TextStyle blackInterSemiBoldDarkBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackInterSemiBoldDarkGreen10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.darkGreen,
  );

  static final TextStyle blackInterSemiBoldDarkGrey10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.darkGrey,
  );

  static final TextStyle blackInterSemiBoldElectricBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.electricBlue,
  );

  static final TextStyle blackInterSemiBoldLightBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBlue,
  );

  static final TextStyle blackInterSemiBoldWhite10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.wight,
  );

  static final TextStyle blackInterMediumBlack10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.black,
  );

  static final TextStyle blackInterMediumDarkBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.darkBlue,
  );

  static final TextStyle blackInterMediumDarkGreen10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.darkGreen,
  );

  static final TextStyle blackInterMediumDarkGrey10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.darkGrey,
  );

  // Light Theme Icons
  static const IconThemeData blackIconDarkBlue10 = IconThemeData(size: 10, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGreen10 = IconThemeData(size: 10, color: AppColors.darkGreen);
  static const IconThemeData blackIconDarkGrey10 = IconThemeData(size: 10, color: AppColors.darkGrey);
  static const IconThemeData blackIconBlack11 = IconThemeData(size: 11, color: AppColors.black);
  static const IconThemeData blackIconDarkBlue11 = IconThemeData(size: 11, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGreen11 = IconThemeData(size: 11, color: AppColors.darkGreen);
  static const IconThemeData blackIconDarkGrey11 = IconThemeData(size: 11, color: AppColors.darkGrey);
  static const IconThemeData blackIconWhite11 = IconThemeData(size: 11, color: AppColors.wight);
  static const IconThemeData blackIconBlack12 = IconThemeData(size: 12, color: AppColors.black);
  static const IconThemeData blackIconDarkBlue12 = IconThemeData(size: 12, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGrey12 = IconThemeData(size: 12, color: AppColors.darkGrey);
  static const IconThemeData blackIconElectricBlue12 = IconThemeData(size: 12, color: AppColors.electricBlue);
  static const IconThemeData blackIconLightBlue12 = IconThemeData(size: 12, color: AppColors.lightBlue);
  static const IconThemeData blackIconWhite12 = IconThemeData(size: 12, color: AppColors.wight);
  static const IconThemeData blackIconDarkBlue13 = IconThemeData(size: 13, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGrey13 = IconThemeData(size: 13, color: AppColors.darkGrey);
  static const IconThemeData blackIconBlack14 = IconThemeData(size: 14, color: AppColors.black);
  static const IconThemeData blackIconDarkBlue14 = IconThemeData(size: 14, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGreen14 = IconThemeData(size: 14, color: AppColors.darkGreen);
  static const IconThemeData blackIconDarkGrey14 = IconThemeData(size: 14, color: AppColors.darkGrey);
  static const IconThemeData blackIconBlack15 = IconThemeData(size: 15, color: AppColors.black);
  static const IconThemeData blackIconCoolGray15 = IconThemeData(size: 15, color: AppColors.coolGray);
  static const IconThemeData blackIconDarkBlue15 = IconThemeData(size: 15, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGreen15 = IconThemeData(size: 15, color: AppColors.darkGreen);
  static const IconThemeData blackIconDarkGrey15 = IconThemeData(size: 15, color: AppColors.darkGrey);
  static const IconThemeData blackIconRed15 = IconThemeData(size: 15, color: AppColors.red);
  static const IconThemeData blackIconBlack16 = IconThemeData(size: 16, color: AppColors.black);
  static const IconThemeData blackIconDarkBlue17 = IconThemeData(size: 17, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGreen17 = IconThemeData(size: 17, color: AppColors.darkGreen);
  static const IconThemeData blackIconDarkGrey17 = IconThemeData(size: 17, color: AppColors.darkGrey);
  static const IconThemeData blackIconWhite17 = IconThemeData(size: 17, color: AppColors.wight);
  static const IconThemeData blackIconBlack18 = IconThemeData(size: 18, color: AppColors.black);
  static const IconThemeData blackIconDarkBlue18 = IconThemeData(size: 18, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGrey18 = IconThemeData(size: 18, color: AppColors.darkGrey);
  static const IconThemeData blackIconElectricBlue18 = IconThemeData(size: 18, color: AppColors.electricBlue);
  static const IconThemeData blackIconWhite18 = IconThemeData(size: 18, color: AppColors.wight);
  static const IconThemeData blackIconDarkBlue20 = IconThemeData(size: 20, color: AppColors.darkBlue);
  static const IconThemeData blackIconDarkGrey20 = IconThemeData(size: 20, color: AppColors.darkGrey);
  static const IconThemeData blackIconWhite20 = IconThemeData(size: 20, color: AppColors.wight);
  static const IconThemeData blackIconWhite22 = IconThemeData(size: 22, color: AppColors.wight);
  static const IconThemeData blackIconElectricBlue24 = IconThemeData(size: 24, color: AppColors.electricBlue);
  static const IconThemeData blackIconWhite25 = IconThemeData(size: 25, color: AppColors.wight);
  static const IconThemeData blackIconElectricBlue27 = IconThemeData(size: 27, color: AppColors.electricBlue);
  static const IconThemeData blackIconDarkBlue28 = IconThemeData(size: 28, color: AppColors.darkBlue);
  static const IconThemeData blackIconLightBlue28 = IconThemeData(size: 28, color: AppColors.lightBlue);
  static const IconThemeData blackIconElectricBlue29 = IconThemeData(size: 29, color: AppColors.electricBlue);
  static const IconThemeData blackIconElectricBlue30 = IconThemeData(size: 30, color: AppColors.electricBlue);

  // Dark Theme
  static final TextStyle whiteJakartaBoldPaleBlue32 = GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldPaleBlue20 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaRegularPaleBlue20 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldLavender18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.45,
    color: AppColors.lavender,
  );

  static final TextStyle whiteJakartaSemiBoldPaleBlue18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldWhite18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.wight,
  );

  static final TextStyle whiteJakartaRegularDarkGrey18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.09,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaRegularLavender18 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.lavender,
  );

  static final TextStyle whiteJakartaRegularPaleBlue16 = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.45,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldPaleBlue15 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldWhite15 = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.wight,
  );

  static final TextStyle whiteJakartaMediumDarkGrey14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaRegularPaleBlue14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaRegularWhite14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.14,
    color: AppColors.wight,
  );

  static final TextStyle whiteJakartaRegularDarkGrey13_5 = GoogleFonts.plusJakartaSans(
    fontSize: 13.5,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaSemiBoldElectricBlue13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteJakartaRegularDarkGrey13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaRegularPaleBlue13 = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaSemiBoldPaleBlue12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaSemiBoldWhite12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.wight,
  );

  static final TextStyle whiteJakartaMediumDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaMediumLavender12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
    color: AppColors.lavender,
  );

  static final TextStyle whiteJakartaRegularDarkGrey12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaRegularPaleBlue12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteJakartaBoldElectricBlue11 = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.55,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteJakartaBoldDarkGrey10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.4,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteJakartaBoldElectricBlue10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.4,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteJakartaMediumLavender10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.lavender,
  );

  static final TextStyle whiteJakartaMediumLightBlue10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.lightBlue,
  );

  static final TextStyle whiteJakartaMediumWhite10 = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.wight,
  );


  static final TextStyle whiteInterBoldWhite22 = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.wight,
  );

  static final TextStyle whiteInterSemiBoldPaleBlue20 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterRegularDarkGrey16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterRegularPaleBlue16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterRegularWhite16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: AppColors.wight,
  );

  static final TextStyle whiteInterItalicCoolGray16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    letterSpacing: -0.08,
    color: AppColors.coolGray,
  );

  static final TextStyle whiteInterBoldPaleBlue14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterSemiBoldCoolGray14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.coolGray,
  );

  static final TextStyle whiteInterSemiBoldElectricBlue14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterSemiBoldLavender14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.lavender,
  );

  static final TextStyle whiteInterSemiBoldPaleBlue14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterSemiBoldWhite14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
    color: AppColors.wight,
  );

  static final TextStyle whiteInterRegularCoolGray14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.coolGray,
  );

  static final TextStyle whiteInterRegularDarkGrey14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterRegularPaleBlue14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterRegularDarkGrey13_5 = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterSemiBoldElectricBlue13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterSemiBoldPaleBlue13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterRegularDarkGrey13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterRegularPaleBlue12_5 = GoogleFonts.inter(
    fontSize: 12.5,
    fontWeight: FontWeight.normal,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterSemiBoldDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterSemiBoldElectricBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterSemiBoldLavender12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.lavender,
  );

  static final TextStyle whiteInterSemiBoldLightBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.lightBlue,
  );

  static final TextStyle whiteInterSemiBoldPaleBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterMediumDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterMediumElectricBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterMediumRed12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.24,
    color: AppColors.red,
  );

  static final TextStyle whiteInterRegularCoolGray12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.coolGray,
  );

  static final TextStyle whiteInterRegularDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterItalicDarkGrey12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterItalicPaleBlue12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterSemiBoldCoolGray10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.coolGray,
  );

  static final TextStyle whiteInterSemiBoldDarkGreen10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
  );

  static final TextStyle whiteInterSemiBoldDarkGrey10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.darkGrey,
  );

  static final TextStyle whiteInterSemiBoldElectricBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterSemiBoldLavender10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.lavender,
  );

  static final TextStyle whiteInterSemiBoldLightBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.lightBlue,
  );

  static final TextStyle whiteInterSemiBoldPaleBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.paleBlue,
  );

  static final TextStyle whiteInterSemiBoldPaleGreen10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.paleGreen,
  );

  static final TextStyle whiteInterSemiBoldWhite10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.wight,
  );

  static final TextStyle whiteInterMediumElectricBlue10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.electricBlue,
  );

  static final TextStyle whiteInterMediumPaleGreen10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.paleGreen,
  );

  // Dark Theme Icons
  static const IconThemeData whiteIconDarkGreen10 = IconThemeData(size: 10, color: AppColors.darkGreen);
  static const IconThemeData whiteIconDarkGrey10 = IconThemeData(size: 10, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue10 = IconThemeData(size: 10, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender10 = IconThemeData(size: 10, color: AppColors.lavender);
  static const IconThemeData whiteIconDarkGrey11 = IconThemeData(size: 11, color: AppColors.darkGrey);
  static const IconThemeData whiteIconLavender11 = IconThemeData(size: 11, color: AppColors.lavender);
  static const IconThemeData whiteIconPaleBlue11 = IconThemeData(size: 11, color: AppColors.paleBlue);
  static const IconThemeData whiteIconPaleGreen11 = IconThemeData(size: 11, color: AppColors.paleGreen);
  static const IconThemeData whiteIconWhite11 = IconThemeData(size: 11, color: AppColors.wight);
  static const IconThemeData whiteIconCoolGray12 = IconThemeData(size: 12, color: AppColors.coolGray);
  static const IconThemeData whiteIconDarkGrey12 = IconThemeData(size: 12, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue12 = IconThemeData(size: 12, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender12 = IconThemeData(size: 12, color: AppColors.lavender);
  static const IconThemeData whiteIconLightBlue12 = IconThemeData(size: 12, color: AppColors.lightBlue);
  static const IconThemeData whiteIconWhite12 = IconThemeData(size: 12, color: AppColors.wight);
  static const IconThemeData whiteIconDarkGrey13 = IconThemeData(size: 13, color: AppColors.darkGrey);
  static const IconThemeData whiteIconCoolGray14 = IconThemeData(size: 14, color: AppColors.coolGray);
  static const IconThemeData whiteIconDarkGrey14 = IconThemeData(size: 14, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue14 = IconThemeData(size: 14, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender14 = IconThemeData(size: 14, color: AppColors.lavender);
  static const IconThemeData whiteIconPaleGreen14 = IconThemeData(size: 14, color: AppColors.paleGreen);
  static const IconThemeData whiteIconDarkGrey15 = IconThemeData(size: 15, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue15 = IconThemeData(size: 15, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender15 = IconThemeData(size: 15, color: AppColors.lavender);
  static const IconThemeData whiteIconLightBlue15 = IconThemeData(size: 15, color: AppColors.lightBlue);
  static const IconThemeData whiteIconPaleBlue15 = IconThemeData(size: 15, color: AppColors.paleBlue);
  static const IconThemeData whiteIconPaleGreen15 = IconThemeData(size: 15, color: AppColors.paleGreen);
  static const IconThemeData whiteIconRed15 = IconThemeData(size: 15, color: AppColors.red);
  static const IconThemeData whiteIconLightBlue16 = IconThemeData(size: 16, color: AppColors.lightBlue);
  static const IconThemeData whiteIconWhite16 = IconThemeData(size: 16, color: AppColors.wight);
  static const IconThemeData whiteIconDarkGreen17 = IconThemeData(size: 17, color: AppColors.darkGreen);
  static const IconThemeData whiteIconDarkGrey17 = IconThemeData(size: 17, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue17 = IconThemeData(size: 17, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender17 = IconThemeData(size: 17, color: AppColors.lavender);
  static const IconThemeData whiteIconLightBlue17 = IconThemeData(size: 17, color: AppColors.lightBlue);
  static const IconThemeData whiteIconWhite17 = IconThemeData(size: 17, color: AppColors.wight);
  static const IconThemeData whiteIconCoolGray18 = IconThemeData(size: 18, color: AppColors.coolGray);
  static const IconThemeData whiteIconDarkGrey18 = IconThemeData(size: 18, color: AppColors.darkGrey);
  static const IconThemeData whiteIconElectricBlue18 = IconThemeData(size: 18, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLavender18 = IconThemeData(size: 18, color: AppColors.lavender);
  static const IconThemeData whiteIconLightBlue18 = IconThemeData(size: 18, color: AppColors.lightBlue);
  static const IconThemeData whiteIconPaleBlue18 = IconThemeData(size: 18, color: AppColors.paleBlue);
  static const IconThemeData whiteIconWhite18 = IconThemeData(size: 18, color: AppColors.wight);
  static const IconThemeData whiteIconCoolGray20 = IconThemeData(size: 20, color: AppColors.coolGray);
  static const IconThemeData whiteIconWhite20 = IconThemeData(size: 20, color: AppColors.wight);
  static const IconThemeData whiteIconWhite22 = IconThemeData(size: 22, color: AppColors.wight);
  static const IconThemeData whiteIconLavender24 = IconThemeData(size: 24, color: AppColors.lavender);
  static const IconThemeData whiteIconWhite25 = IconThemeData(size: 25, color: AppColors.wight);
  static const IconThemeData whiteIconLavender27 = IconThemeData(size: 27, color: AppColors.lavender);
  static const IconThemeData whiteIconElectricBlue28 = IconThemeData(size: 28, color: AppColors.electricBlue);
  static const IconThemeData whiteIconLightBlue28 = IconThemeData(size: 28, color: AppColors.lightBlue);
  static const IconThemeData whiteIconLavender29 = IconThemeData(size: 29, color: AppColors.lavender);
  static const IconThemeData whiteIconElectricBlue30 = IconThemeData(size: 30, color: AppColors.electricBlue);
}