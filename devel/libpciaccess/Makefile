PORTNAME=	libpciaccess
PORTVERSION=	0.16
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:misc/pciids

CONFIGURE_ARGS=	--with-pciids-path=${LOCALBASE}/share/pciids
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

USES=		xorg xorg-cat:lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
