--- src/yvalve/why.cpp.orig
+++ src/yvalve/why.cpp
@@ -804,11 +804,14 @@
 		explicit CtrlCHandler(MemoryPool& p)
 			: ShutdownInit(p)
 		{
+			// Set shutdownSemaphore before starting the thread to avoid a
+			// race where shutdownThread sees NULL and exits immediately,
+			// causing jemalloc tcache corruption on thread cleanup.
+			shutdownSemaphore = &semaphore;
 			Thread::start(shutdownThread, 0, 0, &handle);
 
 			procInt = ISC_signal(SIGINT, handlerInt, 0);
 			procTerm = ISC_signal(SIGTERM, handlerTerm, 0);
-			shutdownSemaphore = &semaphore;
 		}
 
 		~CtrlCHandler()
