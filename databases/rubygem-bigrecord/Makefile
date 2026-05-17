PORTNAME=	bigrecord
PORTVERSION=	0.1.1
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intended to work as a drop-in for Rails applications
WWW=		http://www.bigrecord.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord4>=0:databases/rubygem-activerecord4 \
		rubygem-activesupport4>=0:devel/rubygem-activesupport4 \
		rubygem-uuidtools>=2.0.0:devel/rubygem-uuidtools

NO_ARCH=	yes
USES=		gem

.include <bsd.port.mk>
