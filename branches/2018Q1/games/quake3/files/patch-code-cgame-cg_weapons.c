--- ./code/cgame/cg_weapons.c.orig	Wed May 31 18:55:11 2006
+++ ./code/cgame/cg_weapons.c	Wed May 31 19:05:20 2006
@@ -656,17 +656,17 @@
 	}
 
 	strcpy( path, item->world_model[0] );
-	COM_StripExtension( path, path );
+	COM_StripExtension( path, path, sizeof(path) );
 	strcat( path, "_flash.md3" );
 	weaponInfo->flashModel = trap_R_RegisterModel( path );
 
 	strcpy( path, item->world_model[0] );
-	COM_StripExtension( path, path );
+	COM_StripExtension( path, path, sizeof(path) );
 	strcat( path, "_barrel.md3" );
 	weaponInfo->barrelModel = trap_R_RegisterModel( path );
 
 	strcpy( path, item->world_model[0] );
-	COM_StripExtension( path, path );
+	COM_StripExtension( path, path, sizeof(path) );
 	strcat( path, "_hand.md3" );
 	weaponInfo->handsModel = trap_R_RegisterModel( path );
 
