PORTNAME=	after_commit_queue
PORTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows to run callbacks after transaction is committed
WWW=		https://github.com/shellycloud/after_commit_queue

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS?=	rubygem-activerecord4>=3.0:databases/rubygem-activerecord4

NO_ARCH=	yes
USES=		gem

.include <bsd.port.mk>
