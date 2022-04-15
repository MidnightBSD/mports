# Created by: Koop Mast <kwm@FreeBSD.org>


PORTNAME=	argyllcms
PORTVERSION=	1.9.2
CATEGORIES=	graphics
MASTER_SITES=	https://www.argyllcms.com/
DISTNAME=	Argyll_V${PORTVERSION}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ICC compatible color management system

LICENSE=	agpl

BUILD_DEPENDS=	jam:devel/jam
LIB_DEPENDS=	libtiff.so:graphics/tiff \
		libpng.so:graphics/png

WRKSRC=		${WRKDIR}/Argyll_V${PORTVERSION}

USES=		compiler:c11 cpe jpeg ssl xorg zip
USE_XORG=	x11 xau xdmcp xext xinerama xrandr xscrnsaver xxf86vm

post-patch:
	@${REINPLACE_CMD} 's:711:755:g' ${WRKSRC}/Jambase

do-build:
	@cd ${WRKSRC} && ${MAKE_ENV} jam -q -fJambase -j${MAKE_JOBS_NUMBER}

do-install:
	@cd ${WRKSRC} && ${SETENV} DESTDIR=${FAKE_DESTDIR} PREFIX=${TRUE_PREFIX} \
		REFSUBDIR=share/argyll/ref \
		jam -q -fJambase -j${MAKE_JOBS_NUMBER} install
	@${MV} ${STAGEDIR}${PREFIX}/bin/License.txt \
		${STAGEDIR}${PREFIX}/share/argyll/

post-install:
	${STRIP_CMD} ${PREFIX}/bin/*

.include <bsd.port.mk>
