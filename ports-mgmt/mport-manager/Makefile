PORTNAME=	mport-manager
PORTVERSION=	0.2.0
PORTREVISION=	0
CATEGORIES=	ports-mgmt sysutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Graphical Package Manager for MidnightBSD

LICENSE=	bsd2

RUN_DEPENDS+=	gksudo:sysutils/gksu

WRKSRC=         ${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		desktop-file-utils pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     mport-manager
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      b7486c0
USE_CSTD=       c99

USE_XORG=	x11
USE_GNOME=	gtk30
WANT_GNOME=	yes

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor/48x48/apps/
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/applications/
	${CP} ${FILESDIR}/mport-manager.desktop ${PREFIX}/share/applications/

post-install:
	${CP} ${WRKSRC}/icon.png ${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor/48x48/apps/mport-manager.png
	${CP} ${WRKSRC}/icon.png ${FAKE_DESTDIR}${TRUE_PREFIX}/share/pixmaps/mport-manager.png

.include <bsd.port.mk>
