PORTNAME=	gocr
PORTVERSION=	0.52
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://www-e.uni-magdeburg.de/jschulen/ocr/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OCR (Optical Character Recognition) program

LICENSE=	gpl2

LIB_DEPENDS=	libnetpbm.so:graphics/netpbm

USES=		gmake
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-netpbm=${LOCALBASE}
MAKE_ARGS=	prefix=${TRUE_PREFIX} exec_prefix=${TRUE_PREFIX} DESTDIR=${FAKE_DESTDIR}

PLIST_FILES=	bin/gocr \
		share/man/man1/gocr.1.gz

PORTDOCS=	*

DOCSRCDIR1=	${WRKSRC}
DOC_FILES1=	AUTHORS BUGS CREDITS HISTORY README READMEde.txt TODO

DOCSRCDIR2=	${WRKSRC}/doc
DOCSDIR2=	${DOCSDIR}/doc
DOC_FILES2=	*.dtd *.xml *.html *.txt *.fig *.png

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=	X11

X11_USES=		tk
X11_PLIST_FILES=	bin/gocr.tcl

post-patch:
	@${REINPLACE_CMD} -e 's|@LIBS@|-L${LOCALBASE}/lib @LIBS@|g' ${WRKSRC}/src/Makefile.in

post-patch-X11-off:
	@${REINPLACE_CMD} -e '/gocr.tcl/d' ${WRKSRC}/src/Makefile.in
	
post-patch-X11-on:
	@${REINPLACE_CMD} -e 's|exec wish|exec ${WISH}|' ${WRKSRC}/bin/gocr.tcl

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/gocr

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOC_FILES1:S|^|${DOCSRCDIR1}/|} ${FAKE_DESTDIR}${DOCSDIR}
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR2}
	${INSTALL_DATA} ${DOC_FILES2:S|^|${DOCSRCDIR2}/|} ${FAKE_DESTDIR}${DOCSDIR2}

.include <bsd.port.mk>
