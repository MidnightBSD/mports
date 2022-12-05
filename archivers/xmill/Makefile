PORTNAME=	xmill
DISTVERSION=	0.8
CATEGORIES=	archivers
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficient compressor for XML
WWW=		https://sourceforge.net/projects/xmill/

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		dos2unix zip
DOS2UNIX_FILES=	${MAKEFILE} XMill/*.cpp
MAKEFILE=	makefile

PORTDOCS=	*
PORTEXAMPLES=	*
PLIST_FILES=	bin/xcmill bin/xdemill bin/xmilltest bin/xmillexample \
		bin/xmillinspect bin/ppmzip

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
# Allow to build with modern GCC
	@${REINPLACE_CMD} -e 's,friend,& class,' ${WRKSRC}/XMill/*.?pp \
		${WRKSRC}/xmillinspect/xmillinspect.h

do-install:
.for p in ${PLIST_FILES:T}
	(cd ${WRKSRC}/unix && ${INSTALL_PROGRAM} ${p} ${PREFIX}/bin)
.endfor

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/documentation && ${INSTALL_DATA} * ${FAKE_DESTDIR}${DOCSDIR})

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples && ${INSTALL_DATA} * ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
