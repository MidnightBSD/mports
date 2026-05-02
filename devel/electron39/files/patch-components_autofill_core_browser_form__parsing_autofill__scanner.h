--- components/autofill/core/browser/form_parsing/autofill_scanner.h.orig	2026-04-30 23:40:01.454775000 -0400
+++ components/autofill/core/browser/form_parsing/autofill_scanner.h	2026-04-30 23:40:01.460422000 -0400
@@ -10,10 +10,10 @@
 #include "base/compiler_specific.h"
 #include "base/containers/span.h"
 #include "base/memory/raw_span.h"
+#include "components/autofill/core/common/form_field_data.h"
 
 namespace autofill {
 
-class FormFieldData;
 
 // A helper class for parsing a stream of |FormFieldData|'s with lookahead.
 class AutofillScanner {
