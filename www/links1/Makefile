PORTNAME=	links
PORTVERSION=	1.03
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://www.jikos.cz/~mikulas/links/download/
PKGNAMESUFFIX=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lynx-like text WWW browser

LICENSE=	gpl2

GNU_CONFIGURE=	yes

USES=		ssl
CONFLICTS=	links-2*

CONFIGURE_ARGS+=	--with-ssl=${OPENSSLBASE}

.include <bsd.port.mk>
