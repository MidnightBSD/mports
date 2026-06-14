--- cmake/modules/FindSSE.cmake.orig	2026-05-25 23:41:12 UTC
+++ cmake/modules/FindSSE.cmake
@@ -39,7 +39,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
      string(COMPARE EQUAL "avx2" "${_SSE_THERE}" _AVX2_TRUE)
      CHECK_CXX_ACCEPTS_FLAG("-mavx2" _AVX2_OK)
    endif()
-elseif(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+elseif(CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD|MidnightBSD)$")
    if(CPU MATCHES "amd64" OR CPU MATCHES "i.86")
      execute_process(COMMAND sh -c "echo $_CPU_FEATURE" OUTPUT_VARIABLE CPUINFO)
