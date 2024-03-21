PORTNAME=	libpthread-stubs
PORTVERSION=	0.4
CATEGORIES=	devel
MASTER_SITES=	https://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Weak aliases for pthread functions
WWW=		https://xcb.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pathfix tar:bzip2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=${ARCH}-portbld-freebsd12.4

NO_ARCH=	yes

.include <bsd.port.mk>
