PORTNAME=	asciidoctor
PORTVERSION=	1.5.6.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, open source text processor and publishing toolchain

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USE_RUBY=	yes
USES=		gem

PLIST_FILES+=	bin/asciidoctor bin/asciidoctor-safe

post-fake:
	${REINPLACE_CMD} "s|${FAKE_DESTDIR}||g" \
		${FAKE_DESTDIR}${PREFIX}/bin/asciidoctor \
		${FAKE_DESTDIR}${PREFIX}/bin/asciidoctor-safe

.include <bsd.port.mk>
