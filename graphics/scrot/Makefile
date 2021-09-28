PORTNAME=	scrot
DISTVERSION=	1.5
CATEGORIES=	graphics

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	SCReenshOT - command line screen capture utility

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=		DOCS EXTRA
OPTIONS_DEFAULT=	DOCS EXTRA
EXTRA_DESC=		Adds some convenience menu entries

OPTIONS_SUB=

BUILD_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive
LIB_DEPENDS=	libgiblib.so:graphics/giblib \
		libImlib2.so:graphics/imlib2

USE_GITHUB=	yes
GH_ACCOUNT=	resurrecting-open-source-projects

USES=		autoreconf desktop-file-utils xorg
USE_CSTD=	c99
GNU_CONFIGURE=	yes
USE_XORG=	x11 xfixes xcomposite

PORTDOCS=	AUTHORS ChangeLog README.md

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEXTRA}
MASTERSITES+=	https://BSDforge.com/projects/source/graphics/
DISTFILES+=	scrotextra.tgz
DESKFILES=	scrot.area.desktop scrot.delayed.desktop scrot.desktop
BINFILES=	scrot-area scrot-delayed scrot-full
.endif

post-install:
	${CP} ${BINFILES:S|^|${WRKDIR}/|} ${PREFIX}/bin/
	${CHMOD} 0755 ${PREFIX}/bin/*
	${CP} ${DESKFILES:S|^|${WRKDIR}/|} ${PREFIX}/share/applications/
	${CP} ${WRKDIR}/scrot.png ${PREFIX}/share/pixmaps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps/
	${CP} ${WRKDIR}/scrot.png ${PREFIX}/share/icons/hicolor/48x48/apps/

.include <bsd.port.mk>
