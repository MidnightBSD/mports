PORTNAME=	libwww
PORTVERSION=	5.4.2
CATEGORIES=	www devel
MASTER_SITES=	https://www.w3.org/Library/Distribution/ \
		https://www.w3.org/Library/Distribution/old/
DISTNAME=	w3c-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	W3C Reference Library
WWW=		https://www.w3.org/Library/

LICENSE=	w3cipr
LICENSE_NAME=	W3C IPR SOFTWARE NOTICE
LICENSE_FILE=	${WRKSRC}/LICENSE.html
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		cpe gmake libtool localbase perl5 ssl tar:tgz
USE_PERL5=	build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --with-zlib --with-ssl=${OPENSSLBASE}
CPE_VENDOR=	w3c

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-install:
	${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
