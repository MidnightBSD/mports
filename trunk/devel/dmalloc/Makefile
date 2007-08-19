# New ports collection makefile for:	dmalloc
# Date created:			7 December 2000
# Whom:				Jeremy Shaffner <jeremy@external.org>
#
# $FreeBSD: ports/devel/dmalloc/Makefile,v 1.15 2006/08/14 22:55:06 clsung Exp $
# $MidnightBSD: mports/devel/dmalloc/Makefile,v 1.2 2007/04/30 03:29:00 ctriv Exp $
#

PORTNAME=	dmalloc
PORTVERSION=	5.4.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	dmalloc
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable debug memory allocation library

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-threads --enable-shlib
CFLAGS+=	-fPIC
USE_LDCONFIG=	yes

ALL_TARGET=	all heavy
INSTALL_TARGET=	install
FAKE_OPTS=	prefixhack

INFO=	dmalloc

.if !defined(NOPORTDOCS)
INSTALL_TARGET+=installdocs installinfo
.endif

pre-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|\.so|\.so.1|' ${WRKSRC}/Makefile.in

post-install:
	@(cd ${PREFIX}/lib; \
		${LN} -sf ${PREFIX}/lib/libdmalloc.so.1 ${PREFIX}/lib/libdmalloc.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocxx.so.1 ${PREFIX}/lib/libdmallocxx.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocth.so.1 ${PREFIX}/lib/libdmallocth.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocthcxx.so.1 ${PREFIX}/lib/libdmallocthcxx.so)

.include <bsd.port.mk>
