--- ./code/ui/ui_players.c.orig	Wed May 31 18:55:11 2006
+++ ./code/ui/ui_players.c	Wed May 31 19:10:27 2006
@@ -90,13 +90,13 @@
 
 	if ( weaponNum == WP_MACHINEGUN || weaponNum == WP_GAUNTLET || weaponNum == WP_BFG ) {
 		strcpy( path, item->world_model[0] );
-		COM_StripExtension( path, path );
+		COM_StripExtension( path, path, sizeof(path) );
 		strcat( path, "_barrel.md3" );
 		pi->barrelModel = trap_R_RegisterModel( path );
 	}
 
 	strcpy( path, item->world_model[0] );
-	COM_StripExtension( path, path );
+	COM_StripExtension( path, path, sizeof(path) );
 	strcat( path, "_flash.md3" );
 	pi->flashModel = trap_R_RegisterModel( path );
 
