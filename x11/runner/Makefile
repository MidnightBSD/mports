PORTNAME=	runner
PORTVERSION=	1.1
PORTREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	http://www.boomerangsworld.de/cms/tools/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast program launch menu for X Window System
WWW=		http://www.boomerangsworld.de/cms/tools/runner.html

LICENSE=	gpl2+

USES=		compiler:c++0x tar:bzip2 xorg
GNU_CONFIGURE=	yes
USE_XORG=	ice sm x11 xft xinerama

USE_GCC=	13

PLIST_FILES=	bin/${PORTNAME} ${DATADIR_REL}/program_list
PORTDOCS=	AUTHORS ChangeLog README

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
