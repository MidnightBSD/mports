# Created by: Rui Lopes (rgl ruilopes com)

PORTNAME=	tzinfo
PORTVERSION=	1.2.10
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Daylight-savings aware timezone support for Ruby

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-thread_safe>=0.1<1:devel/rubygem-thread_safe

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

PORTSCOUT=	limit:^1\.

.include <bsd.port.mk>
