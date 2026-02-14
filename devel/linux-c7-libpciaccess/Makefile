PORTNAME=	libpciaccess
PORTVERSION=	0.14
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library (CentOS ${LINUX_DIST_VER})

LICENSE=	mit

SKIP_FAKE_ALL=  yes

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
