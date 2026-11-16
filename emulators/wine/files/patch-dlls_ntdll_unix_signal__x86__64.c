--- dlls/ntdll/unix/signal_x86_64.c.orig
+++ dlls/ntdll/unix/signal_x86_64.c
@@ -196,6 +196,7 @@
 
 #elif defined(__FreeBSD__) || defined (__FreeBSD_kernel__)
 
+#include <machine/segments.h>
 #include <machine/trap.h>
 
 #define RAX_sig(context)     ((context)->uc_mcontext.mc_rax)
@@ -1801,7 +1802,7 @@
                    "1:\tmovq %rdi,%rsp\n\t"    /* user_rsp */
                    "movq 0x98(%r14),%rbp\n\t"  /* prev_frame->rbp */
                    "ldmxcsr 0xd8(%r14)\n\t"    /* prev_frame->xsave.MxCsr */
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
                    "movw 0x338(%r13),%ax\n"    /* amd64_thread_data()->fs */
                    "testw %ax,%ax\n\t"
                    "jz 1f\n\t"
@@ -2733,6 +2734,16 @@
     if ((ret = modify_ldt( &ldt_info ))) ERR( "modify_ldt failed %d\n", ret );
 #elif defined(__APPLE__)
     if (i386_set_ldt(sel >> 3, (union ldt_entry *)&entry, 1) < 0) perror("i386_set_ldt");
+#elif defined(__FreeBSD__)
+    struct i386_ldt_args p;
+    p.start = sel >> 3;
+    p.descs = (struct user_segment_descriptor *)&entry;
+    p.num   = 1;
+    if (sysarch(I386_SET_LDT, &p) == -1)
+    {
+        perror("i386_set_ldt");
+        exit(1);
+    }
 #else
     fprintf( stderr, "No LDT support on this platform\n" );
     exit(1);
@@ -2854,6 +2865,8 @@
         fs32_sel = alloc_fs_sel( -1, wow_teb );
 #elif defined(__APPLE__)
         cs32_sel = ldt_alloc_entry( ldt_make_cs32_entry() );
+#elif defined(__FreeBSD__)
+        cs32_sel = GSEL(GUCODE32_SEL, SEL_UPL);
 #endif
     }
 
@@ -2913,6 +2926,7 @@
     }
 #elif defined (__FreeBSD__) || defined (__FreeBSD_kernel__)
     amd64_set_gsbase( teb );
+    amd64_get_fsbase( &thread_data->pthread_teb );
 #elif defined(__NetBSD__)
     sysarch( X86_64_SET_GSBASE, &teb );
 #elif defined (__APPLE__)
@@ -3126,6 +3140,32 @@
                    "syscall\n\t"
                    "leaq -0x98(%rbp),%rcx\n"
                    "2:\n\t"
+#elif defined(__FreeBSD__)
+                   "movq 0x320(%r13),%rsi\n\t"     /* amd64_thread_data()->pthread_teb */
+                   "testq %rsi,%rsi\n\t"
+                   "jz 2f\n\t"
+                   "cmpb $0,0x7ffe028a\n\t"        /* user_shared_data->ProcessorFeatures[PF_RDWRFSGSBASE_AVAILABLE] */
+                   "jz 1f\n\t"
+                   /* the kernel only preserves fsbase across context switches
+                    * while %fs holds the default selector, so reset it first */
+                   "movl $0x13,%edi\n\t"           /* GSEL(GUFS32_SEL, SEL_UPL) */
+                   "movw %di,%fs\n\t"
+                   "wrfsbase %rsi\n\t"
+                   "jmp 2f\n"
+                   "1:\n\t"
+                   "pushq %r8\n\t"
+                   "pushq %r9\n\t"
+                   "pushq %r10\n\t"
+                   "pushq %r11\n\t"
+                   "movq $0xa5,%rax\n\t"           /* sysarch */
+                   "movq $0x81,%rdi\n\t"           /* AMD64_SET_FSBASE */
+                   "syscall\n\t"
+                   "popq %r11\n\t"
+                   "popq %r10\n\t"
+                   "popq %r9\n\t"
+                   "popq %r8\n\t"
+                   "leaq -0x98(%rbp),%rcx\n"
+                   "2:\n\t"
 #elif defined __APPLE__
                    "movq 0x320(%r13),%rdi\n\t"     /* amd64_thread_data()->pthread_teb */
                    "xorl %esi,%esi\n\t"
@@ -3172,11 +3212,16 @@
                    __ASM_CFI(".cfi_remember_state\n\t")
                    __ASM_CFI_CFA_IS_AT2(rcx, 0xa8, 0x01) /* frame->syscall_cfa */
                    "leaq 0x70(%rcx),%rsp\n\t"      /* %rsp > frame means no longer inside syscall */
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
                    "movw 0x338(%r13),%dx\n"        /* amd64_thread_data()->fs */
                    "testw %dx,%dx\n\t"
                    "jz 1f\n\t"
                    "movw %dx,%fs\n"
+# ifdef __FreeBSD__
+                   /* reset %ss (after sysret) for AMD */
+                   "movw $0x3b,%dx\n\t"           /* GSEL(GUDATA_SEL, SEL_UPL) */
+                   "movw %dx,%ss\n\t"
+# endif
                    "1:\n\t"
 #elif defined __APPLE__
                    "movq %rax,%r8\n\t"
@@ -3412,7 +3457,32 @@
                    "jmp 2f\n"
                    "1:\tmov $0x1002,%edi\n\t"      /* ARCH_SET_FS */
                    "mov $158,%eax\n\t"             /* SYS_arch_prctl */
+                   "syscall\n\t"
+                   "2:\n\t"
+#elif defined(__FreeBSD__)
+                   "movq 0x320(%r13),%rsi\n\t"     /* amd64_thread_data()->pthread_teb */
+                   "testq %rsi,%rsi\n\t"
+                   "jz 2f\n\t"
+                   "cmpb $0,0x7ffe028a\n\t"        /* user_shared_data->ProcessorFeatures[PF_RDWRFSGSBASE_AVAILABLE] */
+                   "jz 1f\n\t"
+                   /* the kernel only preserves fsbase across context switches
+                    * while %fs holds the default selector, so reset it first */
+                   "movl $0x13,%edi\n\t"           /* GSEL(GUFS32_SEL, SEL_UPL) */
+                   "movw %di,%fs\n\t"
+                   "wrfsbase %rsi\n\t"
+                   "jmp 2f\n"
+                   "1:\n\t"
+                   "pushq %r8\n\t"
+                   "pushq %r9\n\t"
+                   "pushq %r10\n\t"
+                   "pushq %r11\n\t"
+                   "movq $0xa5,%rax\n\t"           /* sysarch */
+                   "movq $0x81,%rdi\n\t"           /* AMD64_SET_FSBASE */
                    "syscall\n\t"
+                   "popq %r11\n\t"
+                   "popq %r10\n\t"
+                   "popq %r9\n\t"
+                   "popq %r8\n\t"
                    "2:\n\t"
 #elif defined __APPLE__
                    "movq 0x320(%r13),%rdi\n\t"     /* amd64_thread_data()->pthread_teb */
@@ -3440,11 +3510,16 @@
                    /* switch to user stack */
                    "movq 0x88(%rcx),%rsp\n\t"
                    __ASM_CFI(".cfi_restore_state\n\t")
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
                    "movw 0x338(%r13),%dx\n"        /* amd64_thread_data()->fs */
                    "testw %dx,%dx\n\t"
                    "jz 1f\n\t"
                    "movw %dx,%fs\n"
+# ifdef __FreeBSD__
+                   /* reset %ss (after sysret) for AMD */
+                   "movw $0x3b,%dx\n\t"           /* GSEL(GUDATA_SEL, SEL_UPL) */
+                   "movw %dx,%ss\n\t"
+# endif
                    "1:\n\t"
 #elif defined __APPLE__
                    "movq %rax,%rdx\n\t"
