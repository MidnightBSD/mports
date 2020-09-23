PORTNAME=	uthash
PORTVERSION=	2.1.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	hash table for C structures

LICENSE=	bsd1
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	DOCS

NO_BUILD=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	troydhanson

PORTDOCS=	ChangeLog.txt userguide.txt utarray.txt \
		utlist.txt utstring.txt
PLIST_FILES=	include/utarray.h include/uthash.h include/utlist.h \
		include/utstring.h

do-install:
	${INSTALL_DATA} ${WRKSRC}/src/utarray.h \
		${WRKSRC}/src/uthash.h \
		${WRKSRC}/src/utlist.h \
		${WRKSRC}/src/utstring.h ${STAGEDIR}${PREFIX}/include/
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/doc/${f} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
