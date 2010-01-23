# $MidnightBSD: mports/sysutils/fusefs-ntfs/Makefile,v 1.6 2010/01/09 18:49:19 laffer1 Exp $

PORTNAME=	ntfs
PORTVERSION=	2009.4.4
CATEGORIES=	sysutils
MASTER_SITES=	http://www.ntfs-3g.org/
PKGNAMEPREFIX=	fusefs-
DISTNAME=	${PORTNAME}-3g-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mount NTFS partitions and disk images
LICENSE=	gpl2

BUILD_DEPENDS=	fusefs-libs>=2.7.2:${PORTSDIR}/sysutils/fusefs-libs
LIB_DEPENDS=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS=	${LOCALBASE}/modules/fuse.ko:${PORTSDIR}/sysutils/fusefs-kmod

USE_ICONV=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS=	--exec-prefix=${PREFIX} --prefix=${PREFIX} --mandir=${PREFIX}/man

OPTIONS=	LOCK "Lock the device when mounting (avoids access)" on \
		UBLIO "Enable user space cache for improved speed" on

SUB_FILES=	pkg-message
DOCSDIR=	${PREFIX}/share/doc/ntfs-3g

MAN8=		ntfs-3g.8 ntfs-3g.probe.8
MLINKS=		ntfs-3g.8 mount_ntfs-3g.8

.include <bsd.port.pre.mk>

.if defined(WITH_LOCK)
CFLAGS+=	-DUSE_LOCK
.endif

.if defined(WITH_UBLIO)
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-ublio
LIB_DEPENDS+=	ublio.1:${PORTSDIR}/devel/libublio
CFLAGS+=	-DUSE_UBLIO
.endif

.if defined(NOPORTDOCS)
post-patch:
	@${REINPLACE_CMD} -Ee 's|^(install-data-am:) .*|\1|' \
		${WRKSRC}/Makefile.in
.endif

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL_DATA} ${FILESDIR}/README.FreeBSD ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
