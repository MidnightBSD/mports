--- asteroids.c.orig	2026-01-07 15:02:35 UTC
+++ asteroids.c
@@ -1333,7 +1333,7 @@ void impactShip(Spaceship *ship, HitData impactData){
 					numberOfPlayersActive--;
 					playerMaxLevel[P(playerNumber)] = levelNumber;
 					if(numberOfPlayersActive <= 0)
-						glutTimerFunc(3000, endGame, NULL); //end the game after 3 seconds; after all; no one is playing!
+						glutTimerFunc(3000, endGame, 0); //end the game after 3 seconds; after all; no one is playing!
 				}
 				else{
 					glutTimerFunc(0, resurrectShip, playerNumber); //rebuild after 3 seconds
@@ -1879,7 +1879,7 @@ void insertNode( NodePtr *startPtr, Object valueIn ){
 	*/
 	}
 	else{
-		endGame(NULL);
+		endGame(0);
 	}
 }
 
@@ -1909,4 +1909,4 @@ boolean isEmpty( NodePtr nodePtr ){
 		return true;
 	else
 		return false;
-}
\ No newline at end of file
+}
