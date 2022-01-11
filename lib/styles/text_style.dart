import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Following are the constant text styles that are using in application
/// with minimal information can be define here, with the properties
/// color: , fontSide: , fontWeight: , fontFamily: ,
/// although these parameters can be override or append with other propertis by using
/// [copyWith()] method provided by [TextStyle] widget
///
/// [FontWeight.w100] == Thin-The least thick
/// [FontWeight.w200] == Extra-Light
/// [FontWeight.w300] == Light
/// [FontWeight.w400] == Normal/ Regular/ Plain
/// [FontWeight.w500] == Medium
/// [FontWeight.w600] == Semi-Bold
/// [FontWeight.w700] == Bold
/// [FontWeight.w800] == Extra-Bold
/// [FontWeight.w900] == Black-The most thick
///
/// [TextOverflow.clip] == To show the overflowed text from next line
/// [TextOverflow.ellipsis] == To hide the overflowed text
/// [TextOverflow.fade] == To fade the overflowed text
/// [TextOverflow.visible] == To just visible as it is
///
///
/// constants for use for fontSize: 11.00 pt
/// property color: for these constants will be default by the framework whick can be overwrite
///
///
TextStyle pacificoFont = GoogleFonts.pacifico();
TextStyle comfortaa = GoogleFonts.comfortaa();
TextStyle montserrat = GoogleFonts.montserrat();
TextStyle poiretOne = GoogleFonts.poiretOne();
// const String MONTSERRAT_FONT_FAMILY = "mons";
//
//
// /// these constants can be short search within any IDE by typing their first letter after (_) underscore letter
// /// for expample for below constant type "ts11MR" and select from suggestions
// ///
// ///
// const TextStyle ts11PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 11.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts11PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 11.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts11PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 11.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts11PT_MONTSERRAT_BOLD = TextStyle(fontSize: 11.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts12PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 12.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts12PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 12.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts12PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 12.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts12PT_MONTSERRAT_BOLD = TextStyle(fontSize: 12.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts13PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 13.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts13PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 13.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts13PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 13.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts13PT_MONTSERRAT_BOLD = TextStyle(fontSize: 13.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts14PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts14PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts14PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 14.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts14PT_MONTSERRAT_BOLD = TextStyle(fontSize: 14.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts15PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 15.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts15PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 15.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts15PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 15.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts15PT_MONTSERRAT_BOLD = TextStyle(fontSize: 15.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts16PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 16.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts16PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 16.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts16PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 16.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts16PT_MONTSERRAT_BOLD = TextStyle(fontSize: 16.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts18PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts18PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 18.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts18PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 18.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts18PT_MONTSERRAT_BOLD = TextStyle(fontSize: 18.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);
//
// const TextStyle ts20PT_MONTSERRAT_REGULAR = TextStyle(fontSize: 20.00, fontWeight: FontWeight.w400, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts20PT_MONTSERRAT_MEDIUM = TextStyle(fontSize: 20.00, fontWeight: FontWeight.w500, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts20PT_MONTSERRAT_SEMI_BOLD = TextStyle(fontSize: 20.00, fontWeight: FontWeight.w600, fontFamily: MONTSERRAT_FONT_FAMILY);
// const TextStyle ts20PT_MONTSERRAT_BOLD = TextStyle(fontSize: 20.00, fontWeight: FontWeight.w700, fontFamily: MONTSERRAT_FONT_FAMILY);

final TextStyle ts20ptPacificoREGULAR = pacificoFont.copyWith(fontSize: 20.00, fontWeight: FontWeight.w400);
final TextStyle ts20ptPacificoMEDIUM = pacificoFont.copyWith(fontSize: 20.00, fontWeight: FontWeight.w500);
final TextStyle ts20ptPacificoSEMIBOLD = pacificoFont.copyWith(fontSize: 20.00, fontWeight: FontWeight.w600);
final TextStyle ts20ptPacificoBOLD = pacificoFont.copyWith(fontSize: 20.00, fontWeight: FontWeight.w700);

final TextStyle ts20ptComfortaaREGULAR = comfortaa.copyWith(fontSize: 20.00, fontWeight: FontWeight.w400);
final TextStyle ts20ptComfortaaMEDIUM = comfortaa.copyWith(fontSize: 20.00, fontWeight: FontWeight.w500);
final TextStyle ts20ptComfortaaSEMIBOLD = comfortaa.copyWith(fontSize: 20.00, fontWeight: FontWeight.w600);
final TextStyle ts20ptComfortaaBOLD = comfortaa.copyWith(fontSize: 20.00, fontWeight: FontWeight.w700);

final TextStyle ts20ptPoiretOneREGULAR = poiretOne.copyWith(fontSize: 20.00, fontWeight: FontWeight.w400);
final TextStyle ts20ptPoiretOneMEDIUM = poiretOne.copyWith(fontSize: 20.00, fontWeight: FontWeight.w500);
final TextStyle ts20ptPoiretOneSEMIBOLD = poiretOne.copyWith(fontSize: 20.00, fontWeight: FontWeight.w600);
final TextStyle ts20ptPoiretOneBOLD = poiretOne.copyWith(fontSize: 20.00, fontWeight: FontWeight.w700);

final TextStyle ts20ptMontserratREGULAR = montserrat.copyWith(fontSize: 20.00, fontWeight: FontWeight.w400);
final TextStyle ts20ptMontserratMEDIUM = montserrat.copyWith(fontSize: 20.00, fontWeight: FontWeight.w500);
final TextStyle ts20ptMontserratSEMIBOLD = montserrat.copyWith(fontSize: 20.00, fontWeight: FontWeight.w600);
final TextStyle ts20ptMontserratBOLD = montserrat.copyWith(fontSize: 20.00, fontWeight: FontWeight.w700);
