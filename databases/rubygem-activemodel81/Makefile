PORTNAME=	activemodel
PORTVERSION=	8.1.3
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for building modeling frameworks like Active Record
WWW=		https://github.com/rails/rails/tree/main/activemodel \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activesupport81>=${PORTVERSION}:devel/rubygem-activesupport81

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
