PORTNAME=	myrurema
PORTVERSION=	0.3.5
PORTREVISION=	1
CATEGORIES=	japanese rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool which helps searching/browsing/writing the Japanese Ruby docs
WWW=		https://github.com/yhara/myrurema

RUN_DEPENDS=	rubygem-launchy2>=2.3<3:devel/rubygem-launchy2

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/rurema

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}rubygem-

.include <bsd.port.post.mk>
