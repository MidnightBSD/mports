# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	tcl
PORTVERSION=	8.5.13
DISTVERSIONSUFFIX=	-8.el7
PORTREVISION=	1
CATEGORIES=	lang linux
PKGNAMESUFFIX=	85

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language (Linux CentOS ${LINUX_DIST_VER})

LICENSE=        TclTk
LICENSE_NAME=   Tcl/Tk License
LICENSE_TEXT=	Tcl/Tk License
LICENSE_PERMS=  dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
USE_LINUX_RPM_BAD_PERMS=	yes

CONFLICTS=	linux-c6-${PORTNAME}${PKGNAMESUFFIX}-[0-9]*
DATADIR=	${PREFIX}/usr/share/tcl${PORTVERSION:R}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
