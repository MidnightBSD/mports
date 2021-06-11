# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	jpeg
PORTVERSION=	1.2.90
DISTVERSIONSUFFIX=	-8.el7
PORTREVISION=	4
CATEGORIES=	graphics linux
DISTNAME=	libjpeg-turbo-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SIMD-accelerated JPEG codec (Linux CentOS ${LINUX_DIST_VER})

LICENSE=        bsd3 IJG zlib
LICENSE_COMB=   multi
LICENSE_GROUPS_IJG=     FSF GPL
LICENSE_NAME_IJG=       Independent JPEG Group License
LICENSE_TEXT_IJG=     	Independent JPEG Group License
LICENSE_PERMS_IJG=      dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}-turbo/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/libjpeg-turbo-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
