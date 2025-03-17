--- agent/appconfig/constants_unix.go.orig	2025-03-04 15:59:05.000000000 -0500
+++ agent/appconfig/constants_unix.go	2025-03-17 01:17:21.698424000 -0400
@@ -116,9 +116,9 @@
 var PowerShellPluginCommandName string
 
 // DefaultProgramFolder is the default folder for SSM
-var DefaultProgramFolder = "/etc/amazon/ssm/"
+var DefaultProgramFolder = "/usr/local/etc/amazon/ssm/"
 
-var defaultWorkerPath = "/usr/bin/"
+var defaultWorkerPath = "/usr/local/bin/"
 var DefaultSSMAgentBinaryPath = defaultWorkerPath + "amazon-ssm-agent"
 var DefaultSSMAgentWorker = defaultWorkerPath + "ssm-agent-worker"
 var DefaultDocumentWorker = defaultWorkerPath + "ssm-document-worker"
@@ -140,9 +140,9 @@
 	/*
 	   Powershell command used to be powershell in alpha versions, now it's pwsh in prod versions
 	*/
-	PowerShellPluginCommandName = "/usr/bin/powershell"
+	PowerShellPluginCommandName = "/usr/local/bin/powershell"
 	if _, err := os.Stat(PowerShellPluginCommandName); err != nil {
-		PowerShellPluginCommandName = "/usr/bin/pwsh"
+		PowerShellPluginCommandName = "/usr/local/bin/pwsh"
 	}
 
 	// curdir is amazon-ssm-agent current directory path
