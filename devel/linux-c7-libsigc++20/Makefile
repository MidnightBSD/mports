PORTNAME=	libsigc++20
PORTVERSION=	2.10.0
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++ (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl

SKIP_FAKE_ALL=  yes

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
