PORTNAME=	orc
PORTVERSION=	0.4.31
DISTVERSIONSUFFIX=	-8.el9
PORTREVISION=	3
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and toolset to operate arrays of data (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://gstreamer.freedesktop.org/projects/orc.html

LICENSE=	bsd2 bsd3
LICENSE_COMB=	multi

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	libgcrypt libpsl
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

BIN_DISTNAMES=	${PORTNAME}-${DISTVERSIONFULL} \
		${PORTNAME}-compiler-${DISTVERSIONFULL}

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
