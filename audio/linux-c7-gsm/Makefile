PORTNAME=	gsm
PORTVERSION=	1.0.13
DISTVERSIONSUFFIX=	-11.el7
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GSM audio codec (CentOS ${LINUX_DIST_VER})

LICENSE=        other
# fairly loose, bsdish.

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
