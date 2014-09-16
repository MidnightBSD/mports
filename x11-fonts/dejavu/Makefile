# $FreeBSD: ports/x11-fonts/dejavu/Makefile,v 1.40 2008/05/27 05:35:26 ahze Exp $
#    $MCom: ports/x11-fonts/dejavu/Makefile,v 1.1 2006/10/13 23:29:09 ahze Exp $
# $MidnightBSD$ 

PORTNAME=	dejavu
DISTVERSION=	2.34
CATEGORIES=	x11-fonts
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-fonts-ttf-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitstream Vera Fonts clone with a wider range of characters

LICENSE=        other

RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USES=		tar:bzip2
USE_XORG=	x11
NO_BUILD=	yes
PORTDOCS=	README status.txt unicover.txt langcover.txt
PLIST_SUB=	FONTSDIR="${FONTSDIR:S|${PREFIX}/||}/"
MSG_FILE=	${PKGDIR}/pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
FONTNAME=	${PORTNAME}
FONTSDIR?=	${PREFIX}/lib/X11/fonts/${FONTNAME}
INSTALLS_TTF=	yes

post-patch:
	@${SED} 's|%%FONTSDIR%%|${FONTSDIR}|g' ${MSG_FILE} > ${PKGMESSAGE}

do-install:
	@${MKDIR} ${FONTSDIR}
	@${INSTALL_DATA} ${WRKSRC}/ttf/*.ttf ${FONTSDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
