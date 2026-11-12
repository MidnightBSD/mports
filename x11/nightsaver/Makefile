PORTNAME=	nightsaver
DISTVERSION=	0.2.0
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OLED-friendly X11 screensaver and screen locker, xscreensaver drop-in
WWW=		https://github.com/MidnightBSD/nightsaver

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	unix-selfauth-helper>0:security/unix-selfauth-helper

USES=		cargo xorg
USE_GITHUB=	yes
GH_ACCOUNT=	MidnightBSD
USE_XORG=	xcb

post-install:
	${INSTALL_MAN} ${WRKSRC}/man/nightsaver.1 \
		${WRKSRC}/man/nightsaver-command.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man/nightsaver.toml.5 ${PREFIX}/man/man5
	${INSTALL_DATA} ${WRKSRC}/etc/nightsaver.toml.sample ${PREFIX}/etc
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/etc/xdg/autostart \
		${PREFIX}/etc/pam.d
	${INSTALL_DATA} ${WRKSRC}/etc/nightsaver.desktop \
		${WRKSRC}/etc/nightsaver-lock.desktop ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/etc/autostart/nightsaver.desktop \
		${PREFIX}/etc/xdg/autostart
	${INSTALL_DATA} ${WRKSRC}/etc/pam.d/nightsaver \
		${PREFIX}/etc/pam.d/nightsaver.sample
	${LN} -s nightsaver ${PREFIX}/bin/xscreensaver
	${LN} -s nightsaver-command ${PREFIX}/bin/xscreensaver-command

.include <bsd.port.mk>
