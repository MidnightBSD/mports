--- ./src/itmf/type.cpp.orig	2009-07-14 03:07:08.000000000 +0400
+++ ./src/itmf/type.cpp	2012-01-15 22:14:12.054748862 +0400
@@ -24,19 +24,12 @@
 
 #include "impl.h"
 
-// VStudio idiocy prevents defining template instanced static data
-// in a namespace. Workaround it by defining in global scope.
-// Other platforms will continue to put things in the proper namespace.
-#if defined( _MSC_VER )
-using namespace mp4v2::impl::itmf;
-#else
-namespace mp4v2 { namespace impl { namespace itmf {
-#endif
+namespace mp4v2 { namespace impl {
 
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumBasicType::Entry EnumBasicType::data[] = {
+const itmf::EnumBasicType::Entry itmf::EnumBasicType::data[] = {
     { mp4v2::impl::itmf::BT_IMPLICIT,  "implicit",  "implicit" },
     { mp4v2::impl::itmf::BT_UTF8,      "utf8",      "UTF-8" },
     { mp4v2::impl::itmf::BT_UTF16,     "utf16",     "UTF-16" },
@@ -64,7 +57,7 @@
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumGenreType::Entry EnumGenreType::data[] = {
+const itmf::EnumGenreType::Entry itmf::EnumGenreType::data[] = {
     { mp4v2::impl::itmf::GENRE_BLUES,             "blues",             "Blues" },
     { mp4v2::impl::itmf::GENRE_CLASSIC_ROCK,      "classicrock",       "Classic Rock" },
     { mp4v2::impl::itmf::GENRE_COUNTRY,           "country",           "Country" },
@@ -200,7 +193,7 @@
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumStikType::Entry EnumStikType::data[] = {
+const itmf::EnumStikType::Entry itmf::EnumStikType::data[] = {
     { mp4v2::impl::itmf::STIK_OLD_MOVIE,    "oldmovie",    "Movie" },
     { mp4v2::impl::itmf::STIK_NORMAL,       "normal",      "Normal" },
     { mp4v2::impl::itmf::STIK_AUDIOBOOK,    "audiobook",   "Audio Book" },
@@ -216,7 +209,7 @@
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumAccountType::Entry EnumAccountType::data[] = {
+const itmf::EnumAccountType::Entry itmf::EnumAccountType::data[] = {
     { mp4v2::impl::itmf::AT_ITUNES,  "itunes",   "iTunes" },
     { mp4v2::impl::itmf::AT_AOL,     "aol",      "AOL" },
 
@@ -226,7 +219,7 @@
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumCountryCode::Entry EnumCountryCode::data[] = {
+const itmf::EnumCountryCode::Entry itmf::EnumCountryCode::data[] = {
     { mp4v2::impl::itmf::CC_USA,  "usa",   "United States" },
     { mp4v2::impl::itmf::CC_USA,  "fra",   "France" },
     { mp4v2::impl::itmf::CC_DEU,  "ger",   "Germany" },
@@ -256,7 +249,7 @@
 ///////////////////////////////////////////////////////////////////////////////
 
 template <>
-const EnumContentRating::Entry EnumContentRating::data[] = {
+const itmf::EnumContentRating::Entry itmf::EnumContentRating::data[] = {
     { mp4v2::impl::itmf::CR_NONE,      "none",       "None" },
     { mp4v2::impl::itmf::CR_CLEAN,     "clean",      "Clean" },
     { mp4v2::impl::itmf::CR_EXPLICIT,  "explicit",   "Explicit" },
@@ -266,9 +259,7 @@
 
 ///////////////////////////////////////////////////////////////////////////////
 
-#if defined( _MSC_VER )
-namespace mp4v2 { namespace impl { namespace itmf {
-#endif
+namespace itmf {
 
 ///////////////////////////////////////////////////////////////////////////////
 
