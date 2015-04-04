# $MidnightBSD$

PORTNAME=	protobuf
PORTVERSION=	2.6.0
CATEGORIES=	devel
MASTER_SITES=	https://protobuf.googlecode.com/svn/rc/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data interchange format library

LICENSE=	bsd3

CFLAGS+=	-DGOOGLE_PROTOBUF_NO_RTTI
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		gmake libtool pathfix pkgconfig tar:bzip2

# Clang will generate code that just doesn't work with clementine-player
# if this isn't compiled as though it were C99.
USE_CSTD=	c99

regression-test test: build
	cd ${WRKSRC}/ && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} check

.include <bsd.port.mk>
