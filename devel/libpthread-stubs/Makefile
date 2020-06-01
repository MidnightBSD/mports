PORTNAME=	libpthread-stubs
PORTVERSION=	0.4
CATEGORIES=	devel
MASTER_SITES=	https://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This library provides weak aliases for pthread functions

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pathfix tar:bzip2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=${ARCH}-portbld-freebsd10.4

.include <bsd.port.mk>
