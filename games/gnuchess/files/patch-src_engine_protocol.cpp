--- src/engine/protocol.cpp.orig
+++ src/engine/protocol.cpp
@@ -109,7 +109,7 @@

    // loop

-   while (true) loop_step();
+   while (!engine_quit) loop_step();
 }

 // init()
