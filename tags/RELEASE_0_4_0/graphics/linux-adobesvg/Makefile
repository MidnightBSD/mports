# $MidnightBSD: mports/graphics/linux-adobesvg/Makefile,v 1.3 2009/03/04 00:28:53 laffer1 Exp $
# $FreeBSD: ports/graphics/linux-adobesvg/Makefile,v 1.1 2006/02/18 09:50:32 jylefort Exp $

PORTNAME=	linux-adobesvg
DISTVERSION=	3.01x88
PORTREVISION=   2
CATEGORIES=	graphics www linux
MASTER_SITES=	http://download.adobe.com/pub/adobe/magic/svgviewer/linux/3.x/${DISTVERSION}/en/
DISTNAME=	adobesvg-${DISTVERSION:C|x.*$||}
DISTFILES=	adobesvg-${DISTVERSION}-linux-i386${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Adobe SVG browser plugin (Linux version)
LICENSE=	restricted

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_APPS=	xorglibs
USE_LINUX=	yes

RESTRICTED=	"Redistribution prohibited"
NO_BUILD=	yes

LIBDIR=		${PREFIX}/lib/linux-adobesvg
SHLIBS=		ACE AGM BIB CoolType NPSVG3 SVGCore
SHLIB_FILES=	${SHLIBS:S|^|lib|:S|$|.so|}

PLIST_FILES=	${SHLIB_FILES:S|^|lib/linux-adobesvg/|}
PLIST_DIRS=	${LIBDIR:S|^${PREFIX}/||}
PORTDOCS=	LICENSE.txt ReadMe.html SVGHelp.html

do-install:
	${MKDIR} ${LIBDIR}
	${INSTALL_PROGRAM} ${SHLIB_FILES:S|^|${WRKSRC}/|} ${LIBDIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
