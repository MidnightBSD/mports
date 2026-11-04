PORTNAME=	omniauth-kerberos
PORTVERSION=	0.4.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OmniAuth strategy for Kerberos
WWW=		https://github.com/jgraichen/omniauth-kerberos

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-omniauth-multipassword2>2.0<3:security/rubygem-omniauth-multipassword2 \
		rubygem-timfel-krb5-auth>=0.8<1:security/rubygem-timfel-krb5

USES=		gem
NO_ARCH=	yes

.include <bsd.port.mk>
