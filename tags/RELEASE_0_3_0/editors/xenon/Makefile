# $MidnightBSD: mports/editors/xenon/Makefile,v 1.3 2009/06/07 18:56:58 laffer1 Exp $

PORTNAME=	xenon
PORTVERSION=	1.0.0
PORTREVISION=	4
CATEGORIES=	editors
MASTER_SITES=	http://sydney.proximity.com.au/~ben/xenon/dist/ \
		ftp://yankee.proximitygroup.com/pub/xenon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple X-based text editor
LICENSE=	gpl2

USE_GMAKE=	yes
USE_XORG=	xpm
NOPRECIOUSSOFTMAKEVARS=	yes
MAKEFILE=	${WRKSRC}/makefiles/Makefile.Linux

MAN1=		xe.1

FIX_FILES=	Xe.h XeApp.C XeApp.h XeFontTable.C XeKeyTable.C \
		XeKeyTable.h XeObject.C XeObject.h XeObjectTable.h XeText.C \
		XeText.h

.include <bsd.port.pre.mk>

do-configure:
.for file in ${FIX_FILES}
	@${REINPLACE_CMD} -e 's|#include <ext/|#include <|' \
		-e 's|ulong|u_long|g' -e 's|uint|u_int|g' \
		-e 's|#include <slist>|#include <list>|' \
		-e 's|std::slist|std::list|g' \
		-e 's|#include <hash_map>|#include <ext/hash_map>|' \
		-e 's|std::hash_map|__gnu_cxx::hash_map|g' \
		-e 's|std::hash|__gnu_cxx::hash|g' \
		${WRKSRC}/${file}
.endfor
	@${REINPLACE_CMD} '/friend int compare/d' ${WRKSRC}/KrAtom.h
	@${REINPLACE_CMD} 's|<Undo\*>|<class Undo*>|' ${WRKSRC}/XeText.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xe ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/xe.1 ${PREFIX}/man/man1
	@${MKDIR} ${PREFIX}/share/examples/xe
	${INSTALL_DATA} ${WRKSRC}/xerc ${PREFIX}/share/examples/xe/sample.xerc

.include <bsd.port.post.mk>
