PORTNAME=	icu
DISTVERSION=	76_1
PORTREVISION?=	2 # keep for icu-lx
PORTEPOCH?=	1
CATEGORIES?=	devel
MASTER_SITES=	https://github.com/unicode-org/${PORTNAME}/releases/download/release-${DISTVERSION:S/rc/-&/:S/_/-/g}/
DISTNAME=	icu4c-${DISTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	International Components for Unicode (from IBM)
WWW=		https://icu.unicode.org/

LICENSE=	icu
LICENSE_NAME=	ICU license
LICENSE_FILE=	${WRKSRC}/../LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

SKIP_FAKE_CHECK=	lib/*.67 \
			lib/*.72

GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=--disable-layoutex
CONFIGURE_ARGS+=--with-data-packaging=archive \
		--disable-renaming \
		--disable-samples \
		--enable-static
CPPFLAGS+=	-DICU_NO_USER_DATA_OVERRIDE
MAKE_ARGS=	VERBOSE=1
NO_TEST=	yes
USES+=		compiler:c++11-lib cpe gmake pathfix python:build tar:tgz
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/icu/source

CPE_VENDOR=	${PORTNAME}-project
CPE_PRODUCT=	international_components_for_unicode

ICUMAJOR=	${PORTVERSION:C/\..*//}
PLIST_SUB+=	ICUMAJOR=${ICUMAJOR} ICUVER=${PORTVERSION:C/r.?/1/}

.ifndef PKGNAMESUFFIX
post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/g* \
		${STAGEDIR}${PREFIX}/bin/*conv \
		${STAGEDIR}${PREFIX}/bin/icuexportdata \
		${STAGEDIR}${PREFIX}/bin/icuinfo \
		${STAGEDIR}${PREFIX}/bin/derb \
		${STAGEDIR}${PREFIX}/bin/pkgdata
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/sbin/*
# Filename varies by endianness: icudt<major>b.dat vs. icudt<major>l.dat
	@(cd ${STAGEDIR}${PREFIX} && ${ECHO_CMD} \
		${DATADIR_REL}/${PORTVERSION:C/r.?/1/}/icudt*.dat >>${TMPPLIST})
# hack for firefox
	cd ${PREFIX}/lib && ${LN} -sf libicui18n.so libicui18n.so.67
	cd ${PREFIX}/lib && ${LN} -sf libicuuc.so libicuuc.so.67
	cd ${PREFIX}/lib && ${LN} -sf libicudata.so libicudata.so.67
	cd ${PREFIX}/lib && ${LN} -sf libicuio.so libicuio.so.67
	cd ${PREFIX}/lib && ${LN} -sf libicutest.so libicutest.so.67
	cd ${PREFIX}/lib && ${LN} -sf libicui18n.so libicui18n.so.72
	cd ${PREFIX}/lib && ${LN} -sf libicuuc.so libicuuc.so.72
	cd ${PREFIX}/lib && ${LN} -sf libicudata.so libicudata.so.72
	cd ${PREFIX}/lib && ${LN} -sf libicuio.so libicuio.so.72
	cd ${PREFIX}/lib && ${LN} -sf libicutest.so libicutest.so.72
.endif # PKGNAMESUFFIX

.include <bsd.port.mk>
