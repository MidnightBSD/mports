PORTNAME=	mod_defensible
DISTVERSIONPREFIX=	v
DISTVERSION=	1.5
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache 2.4 module aiming to block IP listed in DNSBL
WWW=		https://github.com/jd/mod_defensible

LICENSE=	Apache-2.0

USES=		apache

USE_GITHUB=	yes
GH_ACCOUNT=	jd

AP_FAST_BUILD=	yes
AP_GENPLIST=	yes
SHORTMODNAME=	defensible

SRC_FILE=	mod_defensible.c

post-patch:
	${REINPLACE_CMD} 's,%%PORTVERSION%%,${PORTVERSION},' \
		${WRKSRC}/mod_defensible.c

.include <bsd.port.mk>
