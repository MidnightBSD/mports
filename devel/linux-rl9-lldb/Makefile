PORTNAME=	lldb
PORTVERSION=	18.1.8
DISTVERSIONSUFFIX=	-1.el9
CATEGORIES=	devel linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The LLVM Debugger for LLVM suite (Rocky Linux ${LINUX_DIST_VER})
WWW=		http://llvm.org

LICENSE=	gpl2+

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	elfutils-libelf python3
USE_LINUX_RPM=	yes
WANT_LINUX32=yes

BIN_DISTNAMES=	${PORTNAME}-${DISTVERSIONFULL}
LIB_DISTNAMES=	${PORTNAME}-devel-${DISTVERSIONFULL}

DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

.include <bsd.port.mk>
