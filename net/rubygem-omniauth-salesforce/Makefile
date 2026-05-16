PORTNAME=	omniauth-salesforce
PORTVERSION=	1.0.5
PORTREVISION=	2
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	mfechner@FreeBSD.org
COMMENT=	OmniAuth strategy for salesforce.com
WWW=		https://github.com/realdoug/omniauth-salesforce

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-omniauth>=1.0<3:security/rubygem-omniauth \
		rubygem-omniauth-oauth2>=1.0<2:net/rubygem-omniauth-oauth2

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
