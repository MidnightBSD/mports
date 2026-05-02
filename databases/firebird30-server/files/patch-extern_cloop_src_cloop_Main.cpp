--- extern/cloop/src/cloop/Main.cpp.orig
+++ extern/cloop/src/cloop/Main.cpp
@@ -28,7 +28,6 @@
 #include <string>
 #include <stdexcept>

-using std::auto_ptr;
 using std::cerr;
 using std::endl;
 using std::exception;
@@ -53,7 +52,7 @@
 	Parser parser(&lexer);
 	parser.parse();

-	auto_ptr<Generator> generator;
+	std::unique_ptr<Generator> generator;

 	if (outFormat == "c++")
 	{
