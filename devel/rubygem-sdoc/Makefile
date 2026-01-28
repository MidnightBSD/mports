PORTNAME=	sdoc
PORTVERSION=	2.6.5
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create rdoc html with javascript search index
WWW=		https://github.com/zzak/sdoc

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-rdoc>=5.0:devel/rubygem-rdoc

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/sdoc bin/sdoc-merge

.include <bsd.port.mk>
