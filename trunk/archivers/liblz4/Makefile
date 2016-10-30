# $MidnightBSD$

PORTNAME=	lz4
PORTVERSION=	131
DISTVERSIONPREFIX=	r
CATEGORIES=	archivers
PKGNAMEPREFIX=	lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LZ4 compression library, lossless and very fast

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

USE_GITHUB=	yes
GH_ACCOUNT=	Cyan4973

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSIONPREFIX}${PORTVERSION}

USES=		gmake pkgconfig
USE_LDCONFIG=	yes

ALL_TARGET=	default		# don't remove this
SO_VER=		1.7.1
PLIST_SUB+=	SO_VER=${SO_VER} SO_VER_MAJ=${SO_VER:R:R}

post-patch:
	@${FIND} ${WRKSRC} -name Makefile | ${XARGS} ${REINPLACE_CMD} \
		-e 's/LIBDIR?=/LOCALLIBDIR=/; s/$$(LIBDIR)/$$(LOCALLIBDIR)/g' \
		-e 's|$$(LOCALLIBDIR)/pkgconfig|$$(PREFIX)/libdata/pkgconfig|' \
		-e '/^MANDIR :=/s|share/||' \
		-e 's/kFreeBSD/& MidnightBSD/' \
		-e 's|$$(MAKE)|${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS}|'
	@${REINPLACE_CMD} -e '/^all:/s/$$/ liblz4.pc/' \
		${WRKSRC}/lib/Makefile
	@${REINPLACE_CMD} -e '/^all:/s|fullbench.*||' \
		${WRKSRC}/programs/Makefile

do-install:
	cd ${WRKSRC} && ${FAKE_MAKEENV} ${MAKE_CMD} install

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/lz4*
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/liblz4.so.${SO_VER}
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/libdata/pkgconfig/liblz4.pc

.include <bsd.port.mk>
