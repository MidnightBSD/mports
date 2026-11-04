PORTNAME=	libnumbertext
PORTVERSION=	1.0.11
CATEGORIES=	textproc
MASTER_SITES=	https://github.com/Numbertext/libnumbertext/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Number to number name and money text conversion libraries
WWW=		https://numbertext.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++11-lang gmake libtool pathfix tar:xz

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
