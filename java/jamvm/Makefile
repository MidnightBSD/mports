# New ports collection makefile for:	jamvm
# Date created:				31 March 2008
# Whom:					Bjoern Koenig
#
# $MidnightBSD: mports/java/jamvm/Makefile,v 1.1 2008/07/08 02:39:30 laffer1 Exp $
# $FreeBSD: ports/java/jamvm/Makefile,v 1.1 2008/04/04 13:14:06 pav Exp $

PORTNAME=	jamvm
PORTVERSION=	1.5.4
CATEGORIES=	java devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/JamVM%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A compact Java virtual machine
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/classpath/glibj.zip:${PORTSDIR}/java/classpath

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-classpath-install-dir=${LOCALBASE}
USE_GMAKE=	yes

OPTIONS=	FFI "use libffi to call native methods" ON \
		ZIP "turn-on zip support in the bootstrap loader" ON

.include <bsd.port.pre.mk>

.if defined(WITH_FFI)
LIB_DEPENDS+=		ffi:${PORTSDIR}/devel/libffi
CONFIGURE_ARGS+=	--enable-ffi
CONFIGURE_ENV+=		CFLAGS="${CFLAGS} `pkg-config libffi --cflags`" LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
.endif

.if defined(WITH_ZIP)
BUILD_DEPENDS+=		zip:${PORTSDIR}/archivers/zip
PLIST_SUB+=		WITH_ZIP="" WITHOUT_ZIP="@comment "
.else
CONFIGURE_ARGS+=	--disable-zip
PLIST_SUB+=		WITH_ZIP="@comment " WITHOUT_ZIP=""
.endif

post-extract:
	@${MV} ${WRKSRC}/src/arch/x86_64.h ${WRKSRC}/src/arch/amd64.h

post-configure:
	@${MV} ${WRKSRC}/src/os/bsd/x86_64 ${WRKSRC}/src/os/bsd/amd64

.include <bsd.port.post.mk>
