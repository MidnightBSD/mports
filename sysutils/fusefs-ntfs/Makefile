# $MidnightBSD: mports/sysutils/fusefs-ntfs/Makefile,v 1.2 2009/04/03 06:22:21 laffer1 Exp $

PORTNAME=	ntfs
PORTVERSION=	1.710
CATEGORIES=	sysutils
MASTER_SITES=	http://www.ntfs-3g.org/:ntfs \
		${MASTER_SITE_FREEBSD_LOCAL:S|$|alepulver/:ublio|}
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}-3g-${PORTVERSION}
EXTRACT_SUFX=	.tgz
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:ntfs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount NTFS partitions and disk images
LICENSE=	gpl2

BUILD_DEPENDS=	fusefs-libs>=2.6.0:${PORTSDIR}/sysutils/fusefs-libs
LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod

ONLY_FOR_ARCHS=	i386 amd64
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS=	--exec-prefix=${PREFIX} --prefix=${PREFIX} --mandir=${PREFIX}/man

OPTIONS=	LOCK "Lock the device when mounting (avoids access)" off \
		UBLIO "Enable user space cache for improved speed" on

MAN8=		ntfs-3g.8

UBLIO_SRC=	libublio-20070103

.include <bsd.port.pre.mk>

.if defined(WITH_LOCK)
CFLAGS+=	-DUSE_LOCK
.endif

.if defined(WITH_UBLIO)
DISTFILES+=	${UBLIO_SRC}.tar.gz:ublio
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-ublio
CFLAGS+=	-DUSE_UBLIO
SUB_FILES+=	pkg-message

post-extract:
	@cd ${WRKDIR}/${UBLIO_SRC} && \
		${CP} ublio.c ${WRKSRC}/libntfs-3g && \
		${CP} *.h ${WRKSRC}/include/ntfs-3g
.else
pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "WARNING: MidnightBSD does not have cache support for block devices. This will considerably reduce the performance of this application, please consider enabling the UBLIO option and following the indications in the post-installation message." | ${FMT}
	@${ECHO_MSG}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|,nonempty||' ${WRKSRC}/src/ntfs-3g.c

.include <bsd.port.post.mk>
