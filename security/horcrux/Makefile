PORTNAME=	horcrux
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3
PORTREVISION=	1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Split files into encrypted fragments
WWW=		https://github.com/jesseduffield/horcrux

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go

USE_GITHUB=	yes
GH_ACCOUNT=	jesseduffield
GH_SUBDIR=	src/github.com/${GH_ACCOUNT}/${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
