PORTNAME=	libexttextcat
PORTVERSION=	3.4.5
CATEGORIES=	textproc
MASTER_SITES=	https://dev-www.libreoffice.org/src/libexttextcat/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Language guessing by N-Gram-Based Text Categorization

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake libtool pathfix tar:xz

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
MAKE_ARGS=	EXEEXT=x
USE_LDCONFIG=	yes

PORTDOCS=	README README.libtextcat TODO

OPTIONS_DEFINE=	DOCS

NO_TEST=	yes

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
