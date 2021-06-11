# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>

PORTNAME=	libtool-ltdl
PORTVERSION=	2.4.2
DISTVERSIONSUFFIX=	-22.el7_3
CATEGORIES=	devel linux
SRC_DISTFILES=	${DISTNAME:S/-ltdl//}${SRC_SUFX}:SOURCE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Runtime libraries for GNU libtool (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../libltdl/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
