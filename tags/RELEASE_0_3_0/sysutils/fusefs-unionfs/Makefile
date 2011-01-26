# $MidnightBSD: mports/sysutils/fusefs-unionfs/Makefile,v 1.1 2007/07/30 00:41:23 laffer1 Exp $

PORTNAME=	unionfs
PORTVERSION=	0.20
CATEGORIES=	sysutils
MASTER_SITES=	http://podgorny.cz/unionfs-fuse/releases/
PKGNAMEPREFIX=	fusefs-
DISTNAME=	unionfs-fuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE based implementation of the well-known unionfs
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod
BUILD_DEPENDS=	${LOCALBASE}/include/fuse.h:${PORTSDIR}/sysutils/fusefs-libs

PLIST_FILES=	bin/unionfs

USE_BZIP2=	yes

do-build:
	(cd ${WRKSRC} && \
	 ${CC} ${CFLAGS} -I${LOCALBASE}/include/fuse \
	 -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=26 -U_POSIX_SYNCHRONIZED_IO \
	 -o unionfs *.c -L${LOCALBASE}/lib ${PTHREAD_LIBS} -lfuse -lm)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unionfs ${TARGETDIR}/bin

.include <bsd.port.mk>
