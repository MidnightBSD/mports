--- tests/test_actual.py.orig
+++ tests/test_actual.py
@@ -20,7 +20,10 @@
 	elif os_type == 'BSD':
 		assert cpuinfo._get_cpu_info_from_registry() == {}
 		assert cpuinfo._get_cpu_info_from_cpufreq_info() == {}
-		assert cpuinfo._get_cpu_info_from_lscpu() == {}
+		if cpuinfo.DataSource.has_lscpu():
+			assert len(cpuinfo._get_cpu_info_from_lscpu()) > 0
+		else:
+			assert cpuinfo._get_cpu_info_from_lscpu() == {}
 		assert cpuinfo._get_cpu_info_from_proc_cpuinfo() == {}
 		assert cpuinfo._get_cpu_info_from_sysctl() == {}
 		assert cpuinfo._get_cpu_info_from_kstat() == {}
