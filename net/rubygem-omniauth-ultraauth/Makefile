PORTNAME=	omniauth-ultraauth
PORTVERSION=	0.0.2
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Passwordless authentication plugin
WWW=		https://ultraauth.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-omniauth_openid_connect>=0.3<1:net/rubygem-omniauth_openid_connect

USES=		gem

NO_ARCH=	yes

post-patch:
	${REINPLACE_CMD} -e 's|"~> 0.3.0"|">= 0.3", "< 1"|' ${WRKSRC}/${PORTNAME}.gemspec

.include <bsd.port.mk>
