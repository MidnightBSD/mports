PORTNAME=	libpciaccess
PORTVERSION=	0.18.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:misc/pciids

meson_ARGS=	
USES=		tar:xz xorg xorg-cat:lib,meson
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
