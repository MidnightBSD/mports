--- mcs/class/System/System.Net.NetworkInformation/NetworkInterface.cs.orig	2021-07-17 01:09:38 UTC
+++ mcs/class/System/System.Net.NetworkInformation/NetworkInterface.cs
@@ -526,7 +526,7 @@ namespace System.Net.NetworkInformation
 			bool runningOnUnix = (Environment.OSVersion.Platform == PlatformID.Unix);
 
 			if (runningOnUnix) {
-				if (Platform.IsMacOS || Platform.IsFreeBSD)
+				if (Platform.IsMacOS || Platform.IsFreeBSD || Platform.isMidnightBSD)
 					return new MacOsNetworkInterfaceAPI ();
 					
 				return new LinuxNetworkInterfaceAPI ();
