PORTNAME=	flipper-active_record
PORTVERSION=	1.3.6
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails70

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveRecord adapter for Flipper
WWW=		https://github.com/jnunemaker/flipper

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord70>=4.2<8:databases/rubygem-activerecord70 \
		rubygem-flipper-gitlab>=${PORTVERSION}<1.4:devel/rubygem-flipper-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
