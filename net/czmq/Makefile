PORTNAME=	czmq
PORTVERSION=	4.2.1
CATEGORIES=	net
MASTER_SITES=	https://github.com/zeromq/${PORTNAME}/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level C Binding for ZeroMQ
WWW=		http://czmq.zeromq.org

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libzmq.so:net/libzmq4

USES=		autoreconf libtool pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libzmq=${LOCALBASE} \
		--with-pkgconfigdir=${LOCALBASE}/libdata/pkgconfig \
		--without-docs
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

INSTALL_TARGET=	install-strip
NO_TEST=	yes

CFLAGS+=	-Wno-error

.include <bsd.port.mk>
