# $FreeBSD: ports/devel/icu/Makefile,v 1.27 2008/02/18 17:06:32 mi Exp $
# $MidnightBSD$
#

PORTNAME=	icu
PORTVERSION=	58.2
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://download.icu-project.org/files/icu4c/${PORTVERSION}/ \
		SF/${PORTNAME}/ICU4C/${PORTVERSION}/
DISTNAME=	icu4c-${PORTVERSION:S/./_/g}
EXTRACT_SUFX=	-src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (from IBM)

LICENSE=	icu
LICENSE_NAME=	ICU license
LICENSE_FILE=	${WRKSRC}/../LICENSE
LICENSE_PERMS=	${_LICENSE_PERMS_DEFAULT}

GNU_CONFIGURE=		yes
OPTIONS_DEFINE=	THREADS
OPTIONS_DEFAULT=	THREADS
THREADS_DESC=	Build thread-safe version of the library

USE_LDCONFIG=		yes

WRKSRC=			${WRKDIR}/icu/source

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-data-packaging=archive \
			--disable-renaming \
			--disable-samples \
			--enable-shared \
			--enable-static
CPPFLAGS+=      -DICU_NO_USER_DATA_OVERRIDE
MAKE_ARGS=      VERBOSE=1

USES=		cpe gmake pathfix  compiler:c++0x
CPE_VENDOR=	icu-project
CPE_PRODUCT=	international_components_for_unicode

ICUMAJOR=	${PORTVERSION:C/\..*//}
PLIST_SUB+=	ICUMAJOR=${ICUMAJOR} ICUVER=${PORTVERSION}

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/CXXFLAGS=/s/-ansi//' \
		${WRKSRC}/configure
.if ! ${PORT_OPTIONS:MTHREADS}
	@${REINPLACE_CMD} -e 's,\(THREADSC.*FLAGS\).*,\1=,g' ${WRKSRC}/config/mh-bsd-gcc
.endif

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/g* \
		${STAGEDIR}${PREFIX}/bin/*conv \
		${STAGEDIR}${PREFIX}/bin/icuinfo \
		${STAGEDIR}${PREFIX}/bin/derb \
		${STAGEDIR}${PREFIX}/bin/pkgdata
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/sbin/*

.include <bsd.port.mk>
