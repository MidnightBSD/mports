# Created by: Kazuo Kuroi <kazuok@projectkitsune.com>

PORTNAME=	emwm
DISTVERSION=	1.3
CATEGORIES=	x11-wm
MASTER_SITES=	https://fastestcode.org/dl/
DISTNAME=	emwm-src-${DISTVERSION}

MAINTAINER=	kazuok@projectkitsune.com
COMMENT=	Enhanced Motif WM fork with multi-monitor and utf-8 support
WWW=		https://fastestcode.org/emwm.html

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		groff:build motif tar:xz xorg
USE_XORG=	x11 xext xinerama xrandr xt

post-patch:
	${LN} -sf ${WRKSRC}/mf/Makefile.FreeBSD ${WRKSRC}/mf/Makefile.MidnightBSD

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/emwm ${STAGEDIR}${PREFIX}/bin/emwm
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/src/emwm.1 ${STAGEDIR}${PREFIX}/share/man/man1/emwm.1
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man4
	${INSTALL_MAN} ${WRKSRC}/src/emwmrc.4 ${STAGEDIR}${PREFIX}/share/man/man4/emwmrc.4
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11
	${INSTALL_DATA} ${WRKSRC}/src/system.emwmrc ${STAGEDIR}${PREFIX}/etc/X11/system.emwmrc
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11/app-defaults
	${INSTALL_DATA} ${WRKSRC}/src/Emwm.ad ${STAGEDIR}${PREFIX}/etc/X11/app-defaults/Emwm

.include <bsd.port.mk>
