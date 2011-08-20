# $FreeBSD: ports/devel/dmalloc/Makefile,v 1.15 2006/08/14 22:55:06 clsung Exp $
# $MidnightBSD: mports/devel/dmalloc/Makefile,v 1.5 2011/07/16 15:23:59 laffer1 Exp $

PORTNAME=	dmalloc
PORTVERSION=	5.5.2
CATEGORIES=	devel
MASTER_SITES=	http://dmalloc.com/releases/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable debug memory allocation library
LICENSE=	other

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS=	--enable-threads --enable-shlib
CFLAGS+=	-fPIC
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

ALL_TARGET=	all heavy
INSTALL_TARGET=	install
FAKE_OPTS=	prefixhack

.if !defined(NOPORTDOCS)
INSTALL_TARGET+=installdocs
.endif

pre-patch:
	@${REINPLACE_CMD} -e 's|\.@shlibext@|\.@shlibext@.1|' ${WRKSRC}/Makefile.in

post-install:
	@(cd ${PREFIX}/lib; \
		${LN} -sf ${PREFIX}/lib/libdmalloc.so.1 ${PREFIX}/lib/libdmalloc.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocxx.so.1 ${PREFIX}/lib/libdmallocxx.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocth.so.1 ${PREFIX}/lib/libdmallocth.so; \
		${LN} -sf ${PREFIX}/lib/libdmallocthcxx.so.1 ${PREFIX}/lib/libdmallocthcxx.so)

.include <bsd.port.mk>
