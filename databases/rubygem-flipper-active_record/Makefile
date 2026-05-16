PORTNAME=	flipper-active_record
PORTVERSION=	1.3.4
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveRecord feature flag adapter for Flipper
WWW=		https://www.flippercloud.io/ \
		https://github.com/flippercloud/flipper

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord80>=4.2<9:databases/rubygem-activerecord80 \
		rubygem-flipper>=${PORTVERSION}<1.4:devel/rubygem-flipper

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
