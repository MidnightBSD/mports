# New ports collection makefile for:	libixp
# Date created:				31 December 2006
# Whom:					Phil Pereira <phil@bsdnexus.com>

PORTNAME=	libixp
PORTVERSION=	0.5
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://dl.suckless.org/libs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone client/server 9P library
WWW=		https://libs.suckless.org/deprecated/libixp/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/libixp/LICENSE

USE_LDCONFIG=	yes
CFLAGS+=	-I. -I${WRKSRC}/include -fPIC
LDFLAGS+=	-L. -L${WRKSRC}/lib
MAKE_ARGS=	PREFIX="${PREFIX}" CC="${CC} -c" LD="${CC}" \
		CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" 

post-patch:
	@${REINPLACE_CMD} -e 's|\.a|.so|g; s|(AR)|(LD) -shared -fPIC -o|' \
		${WRKSRC}/mk/lib.mk ${WRKSRC}/mk/hdr.mk
	@${REINPLACE_CMD} -e 's|\.sowk|.awk|' ${WRKSRC}/mk/hdr.mk
	@${REINPLACE_CMD} -e 's|\(echo.*\)AR\(.*\)|\1LD\2|' ${WRKSRC}/mk/lib.mk
	@${REINPLACE_CMD} -e 's|CFLAGS += $$(DEBUGCFLAGS) -O0 $$(INCS)|& -fPIC|' \
		${WRKSRC}/config.mk
	@${REINPLACE_CMD} -e 's|VERSION|"${PORTVERSION}.${PORTREVISION}"|' \
		${WRKSRC}/cmd/ixpc.c

do-build:
	cd ${WRKSRC}; ${MAKE_ENV} ${MAKE};

do-install:
	@${INSTALL_DATA} ${WRKSRC}/include/ixp.h ${PREFIX}/include
	@${INSTALL_DATA} ${WRKSRC}/include/ixp_srvutil.h ${PREFIX}/include
	@${INSTALL_PROGRAM} ${WRKSRC}/lib/libixp.so ${PREFIX}/lib/libixp.so.1
	@${INSTALL_PROGRAM} ${WRKSRC}/lib/libixp_pthread.so \
		${PREFIX}/lib/libixp_pthread.so.1
	@${LN} -sf libixp.so.1 ${PREFIX}/lib/libixp.so
	@${LN} -sf libixp_pthread.so.1 ${PREFIX}/lib/libixp_pthread.so
	@${INSTALL_PROGRAM} ${WRKSRC}/cmd/ixpc.O ${PREFIX}/bin/ixpc
	@${INSTALL_MAN} ${WRKSRC}/man/ixpc.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
