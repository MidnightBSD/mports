PORTNAME=	libptytty
PORTVERSION=	2.0
CATEGORIES=	sysutils
MASTER_SITES=	http://dist.schmorp.de/libptytty/%SUBDIR%/
MASTER_SITE_SUBDIR=	. Attic

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OS independent and secure pseudo-tty management
WWW=		http://software.schmorp.de/pkg/libptytty.html

LICENSE=	gpl2

USES=		cmake

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	README
PORTEXAMPLES=	c-sample.c

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/eg/c-sample.c ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
