PORTNAME=	icu
PORTVERSION=	67.1
DISTVERSIONSUFFIX=	-9.el9
PORTREVISION=	1
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (Rocky Linux ${LINUX_DIST_VER})
WWW=		http://site.icu-project.org/

LICENSE=        icu
LICENSE_NAME=   ICU license
LICENSE_TEXT=	ICU License
LICENSE_PERMS=  dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cpe linux:rl9
CPE_VENDOR=	${PORTNAME}-project
CPE_PRODUCT=	international_components_for_unicode
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

BIN_DISTNAMES=	${PORTNAME}-${DISTVERSIONFULL}
LIB_DISTNAMES=	lib${PORTNAME}-${DISTVERSIONFULL}
SRC_DISTFILES=	${PORTNAME}-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/lib${PORTNAME}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

PLIST_SUB=	LIBVERSION=${PORTVERSION} LIBVERSION_R=${PORTVERSION:R}

.include <bsd.port.mk>
