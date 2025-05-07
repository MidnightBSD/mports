PORTNAME=	libestr
PORTVERSION=	0.1.11
CATEGORIES=	devel
MASTER_SITES=	https://libestr.adiscon.com/files/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for some string essentials
WWW=		https://libestr.adiscon.com/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe libtool pathfix
CPE_VENDOR=	adiscon
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-testbench

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
