--- agent/appconfig/constants_unix.go.orig	2021-07-07 22:38:05 UTC
+++ agent/appconfig/constants_unix.go
@@ -112,9 +112,9 @@ const (
 var PowerShellPluginCommandName string
 
 // DefaultProgramFolder is the default folder for SSM
-var DefaultProgramFolder = "/etc/amazon/ssm/"
+var DefaultProgramFolder = "/usr/local/etc/amazon/ssm/"
 
-var defaultWorkerPath = "/usr/bin/"
+var defaultWorkerPath = "/usr/local/bin/"
 var DefaultSSMAgentWorker = defaultWorkerPath + "ssm-agent-worker"
 var DefaultDocumentWorker = defaultWorkerPath + "ssm-document-worker"
 var DefaultSessionWorker = defaultWorkerPath + "ssm-session-worker"
@@ -133,7 +133,7 @@ func init() {
 	/*
 	   Powershell command used to be poweshell in alpha versions, now it's pwsh in prod versions
 	*/
-	PowerShellPluginCommandName = "/usr/bin/powershell"
+	PowerShellPluginCommandName = "/usr/local/bin/powershell"
 	if _, err := os.Stat(PowerShellPluginCommandName); err != nil {
 		PowerShellPluginCommandName = "/usr/bin/pwsh"
 	}
