--- tests/test_sh.py.orig
+++ tests/test_sh.py
@@ -62,8 +62,8 @@
                 else:
                     print("Unknown addressing mode %x" % i.mem.address)
             
-            if i.sh_size != 0:
-                print("\t\t\tsh_size: %u" % i.sh_size)
+            if insn.sh_size != 0:
+                print("\t\t\tsh_size: %u" % insn.sh_size)
             c += 1
 
     print_read_write_regs(insn)
