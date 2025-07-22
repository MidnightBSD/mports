PORTNAME=	xli
PORTVERSION=	1.17.0
PORTREVISION=	17
CATEGORIES=	graphics
MASTER_SITES=	DEBIAN
DISTNAME=	xli_${PORTVERSION}+${XLI_SNAPVER:C/-//g}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities to display images in X11

LICENSE=	unknown 

LIB_DEPENDS=	libpng.so:graphics/png

CONFLICTS_INSTALL=	xloadimage-*

FAKE_MAKEARGS+=	DESTDIR=${FAKE_DESTDIR}
USE_XORG=	xi
USES=		cpe imake jpeg xorg
WRKSRC=		${WRKDIR}/xli-${XLI_SNAPVER}

PLIST_FILES=	bin/xli bin/xlito bin/xview bin/xsetbg \
		lib/X11/app-defaults/Xli share/man/man1/xli.1.gz \
		share/man/man1/xlito.1.gz share/man/man1/xview.1.gz share/man/man1/xsetbg.1.gz

XLI_SNAPVER=	2006-11-10

post-install:
	${RLN} ${STAGEDIR}${PREFIX}/share/man/man1/xli.1.gz \
		${STAGEDIR}${PREFIX}/share/man/man1/xview.1.gz
	${RLN} ${STAGEDIR}${PREFIX}/share/man/man1/xli.1.gz \
		${STAGEDIR}${PREFIX}/share/man/man1/xsetbg.1.gz

.include <bsd.port.mk>
