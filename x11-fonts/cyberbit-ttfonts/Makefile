PORTNAME=	cyberbit-ttfonts
PORTVERSION=	2.0.20050220
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://vault.101011010.xyz/distfiles/cyberbit/ \
		http://freebsd.nsu.ru/distfiles/cyberbit/
DISTFILES=	Cyberbit.ZIP 97CyberBase.Doc 97CyberBit.Doc 97CyberCJK.Doc \
		CYBERBIT.DOC CYBERCJK.DOC READMEfirst.txt ReadMe.htm
DIST_SUBDIR=	cyberbit
EXTRACT_ONLY=	Cyberbit.ZIP

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitstream Cyberbit TrueType font that covers Unicode 2.0
WWW=		http://www.bitstream.com/

LICENSE=	CYBERBIT
LICENSE_NAME=	CYBERBIT
LICENSE_TEXT=	Redistribution not permitted; single user license only
LICENSE_PERMS=	auto-accept

RESTRICTED=	Redistribution not permitted; single user license only

USES=		fonts zip

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
SUB_FILES=	pkg-message

PORTDOCS=	97CyberBase.Doc 97CyberBit.Doc 97CyberCJK.Doc \
		CYBERBIT.DOC CYBERCJK.DOC READMEfirst.txt ReadMe.htm

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/Cyberbit.ttf ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${_DISTDIR}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
