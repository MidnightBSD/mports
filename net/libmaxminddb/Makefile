PORTNAME=	libmaxminddb
PORTVERSION=	1.5.0
CATEGORIES=	net
MASTER_SITES=	https://github.com/maxmind/libmaxminddb/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for the MaxMind DB file format used for GeoIP2

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c11 gmake libtool

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

.include <bsd.port.mk>
