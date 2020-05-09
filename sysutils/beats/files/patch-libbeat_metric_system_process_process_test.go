--- libbeat/metric/system/process/process_test.go.orig	2020-05-09 12:56:50.804990000 -0400
+++ libbeat/metric/system/process/process_test.go	2020-05-09 12:57:11.689523000 -0400
@@ -73,7 +73,7 @@
 	assert.True(t, (process.SampleTime.Unix() <= time.Now().Unix()))
 
 	switch runtime.GOOS {
-	case "darwin", "linux", "freebsd":
+	case "darwin", "linux", "midnightbsd", "freebsd":
 		assert.True(t, len(process.Env) > 0, "empty environment")
 	}
 
