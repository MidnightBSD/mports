PORTNAME=	libxslt
PORTVERSION=	1.1.34
DISTVERSIONSUFFIX=	-9.el9_5.3
PORTREVISION=	2
CATEGORIES=	textproc linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XSLT C library for GNOME (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://gitlab.gnome.org/GNOME/libxslt/

LICENSE=	mit

USES=		cpe linux:rl9
CPE_VENDOR=	xmlsoft
USE_LDCONFIG=	yes
USE_LINUX=	libxml2
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
