PORTNAME=	cyrus-sasl
PORTVERSION=	2.1.26
DISTVERSIONSUFFIX=	-24.el7_9
PORTREVISION=	5
CATEGORIES=	security linux
PKGNAMESUFFIX=	-lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 2222 SASL (Simple Authentication and Security Layer) (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.cyrusimap.org/sasl/

LICENSE=	bsd4

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-${PORTNAME}${PKGNAMESUFFIX}
DESCR=		${.CURDIR}/../${PORTNAME}2/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
