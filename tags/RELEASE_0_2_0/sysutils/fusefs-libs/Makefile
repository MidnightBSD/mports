# New ports collection makefile for:    fusefs-libs
# Date created:         01 October 2005
# Whom:                 Anish Mistry
#
# $MidnightBSD: mports/sysutils/fusefs-libs/Makefile,v 1.3 2007/07/29 21:57:54 laffer1 Exp $
# $FreeBSD: ports/sysutils/fusefs-libs/Makefile,v 1.9 2006/09/05 17:25:01 pav Exp $
#

PORTNAME=	fusefs
PORTVERSION=	2.7.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	fuse
PKGNAMESUFFIX=	-libs
DISTNAME=	fuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE allows filesystem implementation in userspace

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MOUNT_FUSE_PATH=${PREFIX}/sbin \
		CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}"
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-kernel-module --prefix=${PREFIX} \
		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
TXT_DOCS=	how-fuse-works \
		kernel.txt

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -e 's,-lpthread,${PTHREAD_LIBS},' \
		-e 's,-D_FILE_OFFSET_BITS=64,-D_FILE_OFFSET_BITS=64 ${PTHREAD_CFLAGS},' \
		${WRKSRC}/fuse.pc.in
	${REINPLACE_CMD} -e 's,-lpthread,${PTHREAD_LIBS},' \
		${WRKSRC}/lib/Makefile.in \
		${WRKSRC}/example/Makefile.in

post-install:
	${INSTALL_DATA} ${WRKSRC}/include/fuse_kernel.h ${PREFIX}/include/fuse

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/libs
.for i in ${TXT_DOCS}
	@${INSTALL_DATA} ${WRKSRC}/doc/$i ${DOCSDIR}/libs
.endfor
.endif

.include <bsd.port.post.mk>
