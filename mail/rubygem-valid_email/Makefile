PORTNAME=	valid_email
PORTVERSION=	0.2.1
PORTREVISION=	1
CATEGORIES=	mail rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveModel Validation for email
WWW=		https://github.com/hallelujah/valid_email

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-activemodel-gitlab>=0:databases/rubygem-activemodel-gitlab \
		rubygem-mail>=2.6.1:mail/rubygem-mail \
		rubygem-simpleidn>=0:dns/rubygem-simpleidn
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
