
$FreeBSD: ports/audio/sdl_mixer/files/patch-SDL_mixer.h,v 1.1 2001/05/08 08:20:10 sobomax Exp $

--- SDL_mixer.h	2001/05/08 07:44:56	1.1
+++ SDL_mixer.h	2001/05/08 07:48:13
@@ -222,6 +222,8 @@
 /* Close the mixer, halting all playing audio */
 extern DECLSPEC void Mix_CloseAudio(void);
 
+extern DECLSPEC int Mix_GetMixerInfo(SDL_AudioSpec *, char *, int);
+
 /* We'll use SDL for reporting errors */
 #define Mix_SetError	SDL_SetError
 #define Mix_GetError	SDL_GetError
