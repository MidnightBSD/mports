PORTNAME=	poppler-data
DISTVERSION=	0.4.11
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data
WWW=		https://poppler.freedesktop.org/

LICENSE=	mit ADOBE gpl2
LICENSE_COMB=	multi
LICENSE_NAME_ADOBE=	Adobe Systems Incorporated license
LICENSE_FILE_ADOBE=	${WRKSRC}/COPYING.adobe  # similar to BSD3CLAUSE
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING.gpl2
LICENSE_PERMS_ADOBE=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		pathfix
PATHFIX_MAKEFILEIN=Makefile

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

post-install:
# Share CMap files with Ghostscript.
	${MKDIR} ${PREFIX}/share/cmap
	${LN} ${PREFIX}/share/poppler/cMap/*/* \
		${PREFIX}/share/cmap

.include <bsd.port.mk>
