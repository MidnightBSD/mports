PORTNAME=	mg
PORTVERSION=	6.6
PORTEPOCH=	1
CATEGORIES=	editors
MASTER_SITES=	https://github.com/ibara/mg/releases/download/mg-${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, fast Emacs-like editor

LICENSE=	publicdom

USES=		ncurses
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}
PLIST_FILES=	bin/mg man/man1/mg.1.gz
PORTDOCS=	README-Mg README.md tutorial

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
