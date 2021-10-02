PORTNAME=	gumbo
PORTVERSION=	0.10.1
DISTVERSIONPREFIX=	v
CATEGORIES=	devel textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure-C HTML5 parser

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	google
GH_PROJECT=	gumbo-parser

USES=		autoreconf gmake pathfix libtool
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libgumbo.so.1.0.0

.include <bsd.port.mk>
