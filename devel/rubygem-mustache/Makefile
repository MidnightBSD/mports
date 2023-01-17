PORTNAME=	mustache
PORTVERSION=	1.1.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework-agnostic way to render logic-free views
WWW=		https://github.com/mustache/mustache

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

PLIST_FILES=	bin/mustache

post-fake:
	${REINPLACE_CMD} "s|${FAKE_DESTDIR}||g" ${FAKE_DESTDIR}${PREFIX}/bin/mustache

.include <bsd.port.mk>
