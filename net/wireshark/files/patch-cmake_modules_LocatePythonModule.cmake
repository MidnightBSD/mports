--- cmake/modules/LocatePythonModule.cmake.orig
+++ cmake/modules/LocatePythonModule.cmake
@@ -28,7 +28,7 @@ function(LOCATE_PYTHON_MODULE module)
 		endif(LPM_PATHS)
 
 		# Use the (native) python impl module to find the location of the requested module
-		execute_process(COMMAND "${PYTHON_EXECUTABLE}" "-c"
-			"import imp; print(imp.find_module('${module}')[1])"
+		execute_process(COMMAND "${PYTHON_EXECUTABLE}" "-c"
+			"import importlib.util; print(importlib.util.find_spec('${module}').origin)"
 			RESULT_VARIABLE _${module}_status
 			OUTPUT_VARIABLE _${module}_location
