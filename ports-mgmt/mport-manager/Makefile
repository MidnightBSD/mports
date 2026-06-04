PORTNAME=	mport-manager
PORTVERSION=	0.3.0
MASTER_SITES=	GH
CATEGORIES=	ports-mgmt sysutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Graphical Package Manager for MidnightBSD
WWW=		https://github.com/laffer1/mport-manager

LICENSE=	bsd2

RUN_DEPENDS+=	gksudo:sysutils/gksudo

USES=		gnome pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     mport-manager
GH_ACCOUNT=     laffer1
USE_CSTD=       c99
FAKE_OPTS=	trueprefix
INSTALL_TARGET=	install

LIB_DEPENDS+=	libvulkan.so:graphics/vulkan-loader \
		libgraphene-1.0.so:graphics/graphene

USE_GNOME=	gtk40 gdkpixbuf cairo

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/applications/
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/icons/hicolor/48x48/apps/

post-fake:
	${STRIP_CMD} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/mport-manager

.include <bsd.port.mk>
