# $MidnightBSD$

PORTNAME=	libgcrypt
PORTVERSION=	1.4.4
PORTERVISION=	1
CATEGORIES=	security linux
PKGNAMEPREFIX=	linux-f10-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG

LICENSE=	gpl3

USE_LINUX=	f10
USE_LINUX_RPM=	yes
RPMVERSION=	1.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	lib/libgcrypt.so.11 lib/libgcrypt.so.11.5.2
PLIST_DIRS=	etc/gcrypt
DESCR=		${.CURDIR}/../libgcrypt/pkg-descr

post-install:
	@${MKDIR} ${PREFIX}/etc/gcrypt

.include <bsd.port.mk>
