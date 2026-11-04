PORTNAME=	libevent
PORTVERSION=	2.1.12
DISTVERSIONSUFFIX=	-8.el9_4
PORTREVISION=	3
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API for executing callback functions on events or timeouts (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://libevent.org/

LICENSE=	bsd3

SKIP_FAKE_ALL=  yes

USES=		linux:rl9
USES+=	cpe
CPE_VENDOR=	libevent_project
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
