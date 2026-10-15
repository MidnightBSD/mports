--- node_modules/@kbn/setup-node-env/node_version_validator.js.orig	2026-09-30 22:19:23 UTC
+++ node_modules/@kbn/setup-node-env/node_version_validator.js
@@ -21,11 +21,16 @@
 var currentVersion = process && process.version || null;
 var rawRequiredVersion = pkg && pkg.engines && pkg.engines.node || null;
 var requiredVersion = rawRequiredVersion ? 'v' + rawRequiredVersion : rawRequiredVersion;
-var isVersionValid = !!currentVersion && !!requiredVersion && currentVersion === requiredVersion;
+var semver = require('semver');
+var isVersionValid = !!currentVersion && !!requiredVersion &&
+  !!semver.valid(currentVersion) && !!semver.valid(requiredVersion) &&
+  !semver.prerelease(currentVersion) &&
+  semver.major(currentVersion) === semver.major(requiredVersion) &&
+  semver.gte(currentVersion, requiredVersion);
 
 // Validates current the NodeJS version compatibility when Kibana starts.
 if (!isVersionValid) {
-  var errorMessage = 'Kibana does not support the current Node.js version ' + currentVersion + '. Please use Node.js ' + requiredVersion + '.';
+  var errorMessage = 'Kibana does not support the current Node.js version ' + currentVersion + '. Please use Node.js ' + requiredVersion + ' or a newer release in the same major version.';
 
   // Actions to apply when validation fails: error report + exit.
   console.error(errorMessage);
