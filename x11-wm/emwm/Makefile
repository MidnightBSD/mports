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
	${INSTALL_PROGRAM} ${WRKSRC}/src/emwm ${PREFIX}/bin/emwm
	${MKDIR} ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/src/emwm.1 ${PREFIX}/share/man/man1/emwm.1
	${MKDIR} ${PREFIX}/share/man/man4
	${INSTALL_MAN} ${WRKSRC}/src/emwmrc.4 ${PREFIX}/share/man/man4/emwmrc.4
	${MKDIR} ${PREFIX}/etc/X11
	${INSTALL_DATA} ${WRKSRC}/src/system.emwmrc ${PREFIX}/etc/X11/system.emwmrc
	${MKDIR} ${PREFIX}/etc/X11/app-defaults
	${INSTALL_DATA} ${WRKSRC}/src/Emwm.ad ${PREFIX}/etc/X11/app-defaults/Emwm

.include <bsd.port.mk>
