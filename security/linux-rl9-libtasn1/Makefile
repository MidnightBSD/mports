PORTNAME=	libtasn1
PORTVERSION=	4.16.0
DISTVERSIONSUFFIX=	-8.el9_1
PORTREVISION=	1
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.gnu.org/software/libtasn1/

LICENSE=	lgpl2.1+

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CPE_VENDOR=	gnu

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
