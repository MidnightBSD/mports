# $MidnightBSD$

PORTNAME=	xli
PORTVERSION=	1.17.0
PORTREVISION=	15
CATEGORIES=	graphics
MASTER_SITES=	DEBIAN
MASTER_SITE_SUBDIR=	pool/main/x/${PORTNAME}
DISTNAME=	xli_${PORTVERSION}+${XLI_SNAPVER:C/-//g}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities to display images in X11

LICENSE=	unknown 

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

CONFLICTS_INSTALL=	xloadimage-*

FAKE_MAKEARGS+=	DESTDIR=${FAKE_DESTDIR}
USE_XORG=	xi
USE_GCC=	any
USES=		imake
WRKSRC=		${WRKDIR}/xli-${XLI_SNAPVER}

PLIST_FILES=	bin/xli bin/xlito bin/xview bin/xsetbg \
		lib/X11/app-defaults/Xli man/man1/xli.1.gz \
		man/man1/xlito.1.gz man/man1/xview.1.gz man/man1/xsetbg.1.gz

XLI_SNAPVER=	2006-11-10

post-install:
	${LN} -s ${MANPREFIX}/man/man1/xli.1.gz \
		${MANPREFIX}/man/man1/xview.1.gz
	${LN} -s ${MANPREFIX}/man/man1/xli.1.gz \
		${MANPREFIX}/man/man1/xsetbg.1.gz

.include <bsd.port.mk>
