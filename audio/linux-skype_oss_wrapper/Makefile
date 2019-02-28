# $MidnightBSD$

PORTNAME=	skype_oss_wrapper
PORTVERSION=	0.1.1
DISTVERSIONPREFIX=	v
CATEGORIES=	audio linux
PKGNAMEPREFIX=	linux-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Partial PulseAudio API implementation using OSS backend

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	s3erios

MAKE_ARGS=	CC=${LINUXBASE}/usr/bin/gcc
USES=		linux
USE_LINUX=	base devtools:build
USE_LINUX_PREFIX=	yes
# do not define USE_LDCONFIG, it's not for global use

ONLY_FOR_ARCHS=	i386 amd64
PLIST_FILES=	lib/skype_oss_wrapper/libpulse.so.0

LIB_DIR=	${PREFIX}/lib/${PORTNAME}

post-install:
	-${RM} ${PREFIX}/bin/skype_oss
	-${RMDIR} ${PREFIX}/bin

.include <bsd.port.mk>
