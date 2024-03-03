PORTNAME=	asio
DISTVERSION=	1.28.1
CATEGORIES=	net devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20(Stable)/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ library for network and low-level I/O programming
WWW=		https://think-async.com/Asio/

LICENSE=	boost
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

USES=		tar:bz2

GNU_CONFIGURE=	yes

NO_BUILD=	yes
NO_ARCH=	yes

INSTALL_TARGET=	install-data

.include <bsd.port.mk>
