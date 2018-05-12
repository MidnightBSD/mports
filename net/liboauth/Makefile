# $MidnightBSD$

PORTNAME=	liboauth
PORTVERSION=	1.0.3
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library implementing the OAuth Core standard

LICENSE=	mit gpl2
LICENSE_COMB=dual

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl

GNU_CONFIGURE=	yes
MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
INSTALL_TARGET=	install-strip

USES=		pkgconfig libtool ssl
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/PC_REQ=/s/ libcrypto//' ${WRKSRC}/configure

.include <bsd.port.mk>
