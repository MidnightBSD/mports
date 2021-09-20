PORTNAME=	asciidoctor
PORTVERSION=	2.0.16
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, open source text processor and publishing toolchain

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

PLIST_FILES=	bin/asciidoctor

post-fake:
	${REINPLACE_CMD} "s|${FAKE_DESTDIR}||g" \
		${FAKE_DESTDIR}${PREFIX}/bin/asciidoctor

.include <bsd.port.mk>
