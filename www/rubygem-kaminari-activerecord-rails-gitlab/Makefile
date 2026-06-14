PORTNAME=	kaminari-activerecord
PORTVERSION=	1.2.2
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-rails-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kaminari Active Record adapter
WWW=		https://github.com/kaminari/kaminari/tree/master/kaminari-activerecord

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/mit-LICENSE

RUN_DEPENDS=	rubygem-activerecord-gitlab>=0:databases/rubygem-activerecord-gitlab \
		rubygem-kaminari-core>=${PORTVERSION}:www/rubygem-kaminari-core

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
