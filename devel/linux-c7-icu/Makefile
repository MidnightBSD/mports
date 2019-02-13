# $MidnightBSD$

PORTNAME=	icu
PORTVERSION=	50.1.2
CATEGORIES=	devel linux
LIB_DISTNAMES=	${LINUXNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	other

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUXNAME}-${PORTVERSION}
LINUXNAME=	lib${PORTNAME}
RPMVERSION=	15.el7
USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
