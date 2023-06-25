PORTNAME=	simpleirc
DISTVERSION=	1.3
CATEGORIES=	irc
MASTER_SITES=	http://dl.suckless.org/tools/

DISTNAME=	sic-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely simple IRC client
WWW=		http://www.suckless.org/programs/sic.html

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

PLIST_FILES=	bin/simpleirc man/man1/simpleirc.1.gz
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${PREFIX}/bin/simpleirc
	-${MV} ${PREFIX}/man1 ${PREFIX}/man/

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
