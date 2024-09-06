PORTNAME=	xxkb
PORTVERSION=	1.11.1
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	SF/${PORTNAME}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XKB keyboard layout indicator and switcher
WWW=		https://sourceforge.net/projects/xxkb/

LICENSE=	artistic

USES=		iconv imake pkgconfig xorg
USE_XORG=	xext xpm xt
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTDOCS=	README CHANGES.ru README.ru

OPTIONS_DEFINE=	LIBRSVG2 DOCS

LIBRSVG2_USES=	gnome
LIBRSVG2_USE=	GNOME=librsvg2,gdkpixbuf2xlib
LIBRSVG2_VARS=	XMKMF_ARGS=-DWITH_SVG_SUPPORT

post-build:
# Convert Russian language docs from archaic KOI8-R to modern UTF-8
.for f in CHANGES README
	iconv -f koi8-r -t utf-8 ${WRKSRC}/${f}.koi8 > ${WRKSRC}/${f}.ru
.endfor

post-install:
	${CP} ${PREFIX}/man/man1/* ${PREFIX}/share/man/man1/

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
