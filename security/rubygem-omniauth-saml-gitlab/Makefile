PORTNAME=	omniauth-saml
PORTVERSION=	2.2.5
CATEGORIES=	security rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OmniAuth strategy for SAML
WWW=		https://github.com/omniauth/omniauth-saml

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-omniauth-gl>=2.1<3:security/rubygem-omniauth-gl \
		rubygem-ruby-saml-gitlab>=1.18<2:security/rubygem-ruby-saml-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
