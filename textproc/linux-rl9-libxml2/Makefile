PORTNAME=	libxml2
PORTVERSION=	2.9.13
DISTVERSIONSUFFIX=	-6.el9_5.2
PORTREVISION=	6
CATEGORIES=	textproc linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing XML and HTML support (Rocky Linux ${LINUX_DIST_VER})
WWW=		http://xmlsoft.org/

LICENSE=	mit

USES=		cpe linux:rl9
CPE_VENDOR=	xmlsoft
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
