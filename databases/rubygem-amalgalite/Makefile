PORTNAME=	amalgalite
PORTVERSION=	1.9.1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embeds the SQLite database engine in a Ruby extension
WWW=		https://github.com/copiousfreetime/amalgalite

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-arrayfields>=4.9<5:devel/rubygem-arrayfields

USES=		gem

PLIST_FILES=	bin/amalgalite-pack

.include <bsd.port.mk>
