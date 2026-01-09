PORTNAME=	mport-manager
PORTVERSION=	0.2.3
PORTREVISION=	2
MASTER_SITES=	GH
CATEGORIES=	ports-mgmt sysutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Graphical Package Manager for MidnightBSD
WWW=		https://github.com/laffer1/mport-manager

LICENSE=	bsd2

RUN_DEPENDS+=	pkexec:sysutils/polkit

USES=		desktop-file-utils gnome pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     mport-manager
GH_ACCOUNT=     laffer1
USE_CSTD=       c99

USE_XORG=	x11
USE_GNOME=	gtk30 gdkpixbuf

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor/48x48/apps/
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/applications/
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/polkit-1/actions
	${CP} ${FILESDIR}/mport-manager.desktop ${PREFIX}/share/applications/
	${CP} ${FILESDIR}/*.policy ${PREFIX}/share/polkit-1/actions/

post-install:
	${CP} ${WRKSRC}/icon.png ${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor/48x48/apps/mport-manager.png
	${CP} ${WRKSRC}/icon.png ${FAKE_DESTDIR}${TRUE_PREFIX}/share/pixmaps/mport-manager.png

.include <bsd.port.mk>
