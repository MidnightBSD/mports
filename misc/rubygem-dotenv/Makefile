PORTNAME=	dotenv
PORTVERSION=	3.2.0
CATEGORIES=	misc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Loads environment variables from .env
WWW=		https://github.com/bkeepers/dotenv

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/dotenv

CONFLICTS_INSTALL=	py*-python-dotenv # bin/dotenv

.include <bsd.port.mk>
