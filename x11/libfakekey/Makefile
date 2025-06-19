PORTNAME=	libfakekey
DISTVERSION=	0.3
CATEGORIES=	x11 kde
MASTER_SITES=	https://git.yoctoproject.org/cgit/cgit.cgi/${PORTNAME}/snapshot/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X virtual keyboard library
WWW=		https://www.yoctoproject.org/tools-resources/projects/matchbox

LICENSE=	lgpl+

USES=		autoreconf libtool pathfix pkgconfig xorg
USE_XORG=	x11 xtst
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=	--disable-static
INSTALL_TARGET=	install-strip

pre-configure:
	cd ${WRKSRC} && ${SETENV} NOCONFIGURE=yes ${SH} ./autogen.sh

.include <bsd.port.mk>
