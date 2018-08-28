# Created by: Koop Mast <kwm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/graphics/argyllcms/Makefile 393785 2015-08-09 12:55:19Z kwm $

PORTNAME=	argyllcms
PORTVERSION=	1.7.0
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://www.argyllcms.com/
DISTNAME=	Argyll_V${PORTVERSION}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ICC compatible color management system

LICENSE=	agpl

BUILD_DEPENDS=	jam:${PORTSDIR}/devel/jam
LIB_DEPENDS=	libtiff.so:${PORTSDIR}/graphics/tiff

WRKSRC=		${WRKDIR}/Argyll_V${PORTVERSION}

USES=		compiler:c11 cpe jpeg zip
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
