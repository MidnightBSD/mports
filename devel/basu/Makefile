PORTNAME=	basu
DISTVERSIONPREFIX=	v
DISTVERSION=	0.2.1
CATEGORIES=	devel
MASTER_SITES=	https://git.sr.ht/~emersion/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	sd-bus library, extracted from systemd
WWW=		https://sr.ht/~emersion/basu/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/LICENSE.LGPL2.1

USES=		compiler:c11 gperf meson python:build shebangfix
USE_LDCONFIG=	yes
SHEBANG_FILES=	src/basic/generate-gperfs.py

USE_GCC=	10+
NO_TEST=	yes

.if exists(/usr/bin/ld.lld) && ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
# bus-error.c:(.text.bus_error_name_to_errno+0x9a): undefined reference to '__start_BUS_ERROR_MAP'
LDFLAGS+=	-fuse-ld=lld
.endif

.include <bsd.port.mk>
