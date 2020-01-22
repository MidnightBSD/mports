PORTNAME=	libmaxminddb
PORTVERSION=	1.4.2
CATEGORIES=	net
MASTER_SITES=	https://github.com/maxmind/libmaxminddb/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for the MaxMind DB file format used for GeoIP2

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c11 gmake libtool

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

.include <bsd.port.mk>
