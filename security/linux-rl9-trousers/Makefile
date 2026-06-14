PORTNAME=	trousers
PORTVERSION=	0.3.15
DISTVERSIONSUFFIX=	-5.el9
CATEGORIES=	security linux
MASTER_SITES=	EPEL9

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source TCG Software Stack (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://sourceforge.net/projects/trousers/

LICENSE=	bsd3

USES=		cpe linux:rl9
SKIP_FAKE_ALL=	yes
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${DISTNAME} \
		${PORTNAME}-lib-${PORTVERSION}${DISTVERSIONSUFFIX}

DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
