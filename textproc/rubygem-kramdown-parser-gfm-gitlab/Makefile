PORTNAME=	kramdown-parser-gfm
PORTVERSION=	1.1.0
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kramdown parser for the GFM dialect of Markdown
WWW=		https://github.com/kramdown/parser-gfm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	rubygem-kramdown-gitlab>=2.0<3:textproc/rubygem-kramdown-gitlab
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
