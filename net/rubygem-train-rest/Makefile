PORTNAME=	train-rest
PORTVERSION=	0.5.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide a transport to communicate easily with RESTful APIs
WWW=		https://github.com/tecracer-chef/train-rest

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-aws-sigv4>=1.5<2:devel/rubygem-aws-sigv4 \
		rubygem-rest-client>=2.1<3:www/rubygem-rest-client \
		rubygem-train-core>=3.0<4:net/rubygem-train-core

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
