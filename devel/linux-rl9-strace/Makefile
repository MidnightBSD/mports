PORTNAME=	strace
PORTVERSION=	5.18
DISTVERSIONSUFFIX=	-2.el9
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	System call tracer (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://sourceforge.net/projects/strace/

USES=		cpe linux:rl9
USE_LINUX=	elfutils-libs
USE_LINUX_RPM=	nolib

CPE_VENDOR=	strace_project

CONFLICTS=	linux-c7-${PORTNAME}
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
