PORTNAME=	sass-listen
PORTVERSION=	4.0.0
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Listens to file modifications
WWW=		https://github.com/sass/listen

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-rb-fsevent>=0.9.4<1:devel/rubygem-rb-fsevent \
		rubygem-rb-inotify>=0.9.7<1:devel/rubygem-rb-inotify
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
