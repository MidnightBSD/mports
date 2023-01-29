PORTNAME=	spandsp
DISTVERSION=	${SPANDSP_VERSION}.g20211014
CATEGORIES=	comms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DSP library and software FAX machine
WWW=		https://www.soft-switch.org/

LICENSE=	lgpl2.1

LIB_DEPENDS=	libtiff.so:graphics/tiff

USES=		autoreconf gmake jpeg libtool localbase

USE_GITHUB=	yes
GH_ACCOUNT=	freeswitch
GH_TAGNAME=	${GITHUB_COMMIT}
GITHUB_COMMIT=	284fe91

USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

SPANDSP_VERSION=	3.0.0

.include <bsd.port.mk>
