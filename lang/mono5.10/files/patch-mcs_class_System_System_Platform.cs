--- mcs/class/System/System/Platform.cs.orig	2021-07-17 01:06:28 UTC
+++ mcs/class/System/System/Platform.cs
@@ -33,6 +33,7 @@ namespace System {
 
 #if MONOTOUCH || XAMMAC
 		const bool isFreeBSD = false;
+		const bool isMidnightBSD = false;
 
 		private static void CheckOS() {
 			isMacOS = true;
@@ -41,6 +42,7 @@ namespace System {
 
 #elif ORBIS
 		const bool isFreeBSD = true;
+		const bool isMidnightBSD = true;
 
  		private static void CheckOS() {
  			checkedOS = true;
@@ -48,6 +50,7 @@ namespace System {
 
 #else
 		static bool isFreeBSD;
+		static bool isMidnightBSD;
 
 		[DllImport ("libc")]
 		static extern int uname (IntPtr buf);
@@ -68,6 +71,9 @@ namespace System {
 				case "FreeBSD":
 					isFreeBSD = true;
 					break;
+				case "MidnightBSD":
+					isMidnightBSD = true;
+					break;
 				}
 			}
 			Marshal.FreeHGlobal (buf);
@@ -90,5 +96,13 @@ namespace System {
 				return isFreeBSD;
 			}
 		}
+
+		public static bool IsMidnightBSD {
+			get {
+				if (!checkedOS)
+					CheckOS();
+				return isMidnightBSD;
+			}
+		}
 	}
 }
