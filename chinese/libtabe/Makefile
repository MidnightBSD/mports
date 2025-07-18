PORTNAME=	libtabe
PORTVERSION=	0.2.6
PORTREVISION=	8
CATEGORIES=	chinese
MASTER_SITES=	http://old-releases.ubuntu.com/ubuntu/pool/universe/libt/libtabe/
DISTNAME=	libtabe_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unified library for Chinese text processing
WWW=		https://libtabe.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		bdb gmake libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
OBSOLETE_BDB_VAR=	USE_DB2
DATADIR=	${PREFIX}/share/tabe
DOCSDIR=	${PREFIX}/share/doc/tabe
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/tabe \
		--with-db-name=${BDB_LIB_NAME} \
		--with-db-inc=${BDB_INCLUDE_DIR} \
		--with-db-lib=${BDB_LIB_DIR} \
		--with-db-bin=${LOCALBASE}/bin
WRKSRC=		${WRKDIR}/${DISTNAME:S|_|-|}
MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=		DOCS X11
OPTIONS_SUB=		yes
X11_USES=		xorg
X11_USE=		XORG=x11
X11_CONFIGURE_WITH=	x

.include <bsd.port.options.mk>

post-patch-X11-off:
	${REINPLACE_CMD} -e '/all:/s/ bims//; /bims/d' \
		${WRKSRC}/src/Makefile.in

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libtabe.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/tsi-src/README \
		${FAKE_DESTDIR}${DOCSDIR}/README.tsi
.if ${PORT_OPTIONS:MX11}
	${INSTALL_DATA} ${WRKSRC}/src/supports/bims/README \
		${FAKE_DESTDIR}${DOCSDIR}/README.bims
.endif
.for DOC in BoPoMoFo.shtml Changes Changes.pre-0.1 TODO ZuYinCode.txt \
		et26.txt libtabe.sgml
	${INSTALL_DATA} ${WRKSRC}/doc/${DOC} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
