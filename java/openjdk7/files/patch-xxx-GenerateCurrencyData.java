--- jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java.orig	2015-08-30 16:18:04.174167371 -0400
+++ jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java	2015-08-30 16:18:39.163676620 -0400
@@ -281,9 +281,6 @@
             checkCurrencyCode(newCurrency);
             String timeString = currencyInfo.substring(4, length - 4);
             long time = format.parse(timeString).getTime();
-            if (Math.abs(time - System.currentTimeMillis()) > ((long) 10) * 365 * 24 * 60 * 60 * 1000) {
-                throw new RuntimeException("time is more than 10 years from present: " + time);
-            }
             specialCaseCutOverTimes[specialCaseCount] = time;
             specialCaseOldCurrencies[specialCaseCount] = oldCurrency;
             specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] = getDefaultFractionDigits(oldCurrency);
