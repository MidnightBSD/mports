# On FreeBSD/i386's LLVM, actual alignment for atomic types requires
# stricter alignment rules, mostly on 8 byte boundaries instead of 4 byte
# as indicated by max_align_t.
#
# Forward-ported from the old patch-i386-protobuf-alignment, which targeted
# toolkit/components/protobuf/src/google/protobuf/arena_impl.h before
# upstream protobuf refactored the lifecycle-id storage into
# thread_safe_arena.h.

--- toolkit/components/protobuf/src/google/protobuf/thread_safe_arena.h.orig
+++ toolkit/components/protobuf/src/google/protobuf/thread_safe_arena.h
@@ -258,7 +258,7 @@
 #pragma warning(disable : 4324)
 #endif
   using LifecycleId = uint64_t;
-  alignas(kCacheAlignment) ABSL_CONST_INIT
+  alignas(alignof(std::atomic<LifecycleId>)) ABSL_CONST_INIT
       static std::atomic<LifecycleId> lifecycle_id_;
 #if defined(PROTOBUF_NO_THREADLOCAL)
  // iOS does not support __thread keyword so we use a custom thread local

--- toolkit/components/protobuf/src/google/protobuf/arena.cc.orig
+++ toolkit/components/protobuf/src/google/protobuf/arena.cc
@@ -539,7 +539,7 @@

-alignas(kCacheAlignment) ABSL_CONST_INIT
+alignas(alignof(std::atomic<uint64_t>)) ABSL_CONST_INIT
     std::atomic<ThreadSafeArena::LifecycleId> ThreadSafeArena::lifecycle_id_{0};
