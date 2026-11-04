PORTNAME=	darts
PORTVERSION=	0.32
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.chasen.org/~taku/software/darts/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ template library that implements Double-Array
WWW=		http://www.chasen.org/~taku/software/darts/

LICENSE=	bsd3 lgpl2.1+
LICENSE_COMB=	dual
LICENSE_FILE_bsd3=${WRKSRC}/BSD
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/LGPL

USES=		autoreconf

GNU_CONFIGURE=	yes

PLIST_FILES=	include/darts.h \
		libexec/darts/darts \
		libexec/darts/mkdarts
PORTDOCS=	AUTHORS ChangeLog README doc
PORTEXAMPLES=	darts.cpp mkdarts.cpp

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.mport.options.mk>

CPPFLAGS+=  -Dregister=

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${CP} -R ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for f in ${PORTEXAMPLES}
	${CP} -R ${WRKSRC}/${f} ${FAKE_DESTDIR}${EXAMPLESDIR}/
.endfor

.include <bsd.port.mk>
