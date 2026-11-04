PORTNAME=	rack-oauth2
PORTVERSION=	2.3.0
PORTREVISION=	1
CATEGORIES=	security rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OAuth 2.0 Server & Client Library
WWW=		https://github.com/nov/rack-oauth2

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activesupport81>=8.1.4.1:devel/rubygem-activesupport81 \
		rubygem-attr_required>=0:devel/rubygem-attr_required \
		rubygem-faraday>=2.0<3:www/rubygem-faraday \
		rubygem-faraday-follow_redirects>=0:www/rubygem-faraday-follow_redirects \
		rubygem-json-jwt>=1.11.0:www/rubygem-json-jwt \
		rubygem-rack>=2.1.0,3:www/rubygem-rack

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
