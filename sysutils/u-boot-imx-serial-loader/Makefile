PORTNAME=	u-boot-imx-serial-loader
PORTVERSION=	2017.01
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Load u-boot via USB or UART on i.MX5, i.MX6, i.MX7, and Vybrid
WWW=		https://github.com/boundarydevices/imx_usb_loader

LICENSE=	lgpl2.1

USE_GITHUB=	yes
GH_ACCOUNT=	boundarydevices
GH_PROJECT=	imx_usb_loader
GH_TAGNAME=	ba6b31c

USES=		gmake pkgconfig

MAKE_ARGS+=	prefix=${PREFIX}

.include <bsd.port.mk>
