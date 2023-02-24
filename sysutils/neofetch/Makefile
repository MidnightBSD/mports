PORTNAME=	neofetch
DISTVERSION=	7.1.0
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, highly customizable system info script
WWW=		https://github.com/dylanaraps/neofetch

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	bash:shells/bash

USE_GITHUB=	yes
GH_ACCOUNT=	dylanaraps

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/neofetch ${FAKE_DESTDIR}${LOCALBASE}/bin
	${INSTALL_MAN} ${WRKSRC}/neofetch.1 ${FAKE_DESTDIR}${LOCALBASE}/share/man/man1

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
