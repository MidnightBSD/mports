# $MidnightBSD: mports/sysutils/fusefs-httpfs/Makefile,v 1.3 2009/04/03 06:20:14 laffer1 Exp $

PORTNAME=	httpfs
PORTVERSION=	2.06.08.26
PORTREVISION=	1
CATEGORIES=	sysutils www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}_with_static_binaries_${PORTVERSION}
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}_with_static_binaries_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fuse-based http filesystem
LICENSE=	gpl2

USE_ICONV=	yes

RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod
BUILD_DEPENDS=	${LOCALBASE}/include/fuse.h:${PORTSDIR}/sysutils/fusefs-libs

PLIST_FILES=	bin/httpfs
WRKSRC=		${WRKDIR}

do-build:
	(cd ${WRKSRC} && ${CC} ${CFLAGS} -I${LOCALBASE}/include/fuse \
	 -DUSE_AUTH -D_FILE_OFFSET_BITS=64 -D_REENTRANT \
	 -DFUSE_USE_VERSION=25 -D_POSIX_C_SOURCE=200112L -D_POSIX_SOURCE \
	 -D_SVID_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=500 \
	 -o httpfs httpfs.c -L${LOCALBASE}/lib ${PTHREAD_LIBS} -lfuse -liconv)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/httpfs ${TARGETDIR}/bin

.include <bsd.port.mk>
