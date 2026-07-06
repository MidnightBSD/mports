PORTNAME=	omniauth-oauth2-generic
PORTVERSION=	0.2.8
CATEGORIES=	security rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic, Configurable OmniAuth Strategy for OAuth2 providers
WWW=		https://gitlab.com/satorix/omniauth-oauth2-generic

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-omniauth-oauth2-gitlab>=1.0<2:net/rubygem-omniauth-oauth2-gitlab \
		rubygem-rake>=0:devel/rubygem-rake
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/console ${STAGEDIR}${PREFIX}/bin/setup

.include <bsd.port.mk>
