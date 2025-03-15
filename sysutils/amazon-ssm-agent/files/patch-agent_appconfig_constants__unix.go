--- agent/appconfig/constants_unix.go.orig	2020-09-02 15:00:33 UTC
+++ agent/appconfig/constants_unix.go
@@ -53,7 +53,7 @@ const (
 	DownloadRoot = "/var/log/amazon/ssm/download/"
 
 	// DefaultDataStorePath represents the directory for storing system data
-	DefaultDataStorePath = "/var/lib/amazon/ssm/"
+	DefaultDataStorePath = "/var/run/amazon/ssm/"
 
 	// EC2ConfigDataStorePath represents the directory for storing ec2 config data
 	EC2ConfigDataStorePath = "/var/lib/amazon/ec2config/"
@@ -98,7 +98,7 @@ const (
 var PowerShellPluginCommandName string
 
 // DefaultProgramFolder is the default folder for SSM
-var DefaultProgramFolder = "/etc/amazon/ssm/"
+var DefaultProgramFolder = "/usr/local/etc/amazon/ssm/"
 var DefaultSSMAgentWorker = "/usr/bin/ssm-agent-worker"
 var DefaultDocumentWorker = "/usr/bin/ssm-document-worker"
 var DefaultSessionWorker = "/usr/bin/ssm-session-worker"
