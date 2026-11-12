--- pygal_gen.py.orig
+++ pygal_gen.py
@@ -26,7 +26,7 @@
     prog='pygal_gen')
 
 parser.add_argument('-t', '--type', dest='type', default='Line',
-                    choices=map(lambda x: x.__name__, pygal.CHARTS),
+                    choices=[chart.__name__ for chart in pygal.CHARTS],
                     help='Kind of chart to generate')
 
 parser.add_argument('-o', '--output', dest='filename', default='pygal_out.svg',
@@ -38,7 +38,7 @@
 parser.add_argument('--version', action='version',
                     version='pygal %s' % pygal.__version__)
 
-for key in pygal.config.CONFIG_ITEMS:
+for key in {item.name: item for item in pygal.config.CONFIG_ITEMS}.values():
     opt_name = key.name
     val = key.value
     opts = {}
