PORTNAME=	junicode
DISTVERSION=	1.002
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${DISTVERSION} \
		http://anthesphoria.net/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unicode/MUFI OpenType font for medievalists (Latin, IPA, Runic, Greek)
WWW=		http://junicode.sourceforge.net/

LICENSE=	OFL11

OPTIONS_DEFINE=	DOCS

WRKSRC=		${WRKDIR}
NO_BUILD=	yes
USES=		fonts zip

do-install:
	@${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}

.include <bsd.port.mk>
