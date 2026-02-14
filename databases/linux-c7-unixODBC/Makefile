PORTNAME=	unixODBC
PORTVERSION=	2.3.1
DISTVERSIONSUFFIX=	-14.el7
CATEGORIES=	databases linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Complete ODBC driver manager (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

SKIP_FAKE_ALL=  yes

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
