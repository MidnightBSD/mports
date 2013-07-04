# $MidnightBSD: mports/print/cmpsfont/Makefile,v 1.2 2009/11/09 00:51:20 laffer1 Exp $

PORTNAME=	cmpsfont
PORTVERSION=	1.0
PORTREVISION=	7
CATEGORIES=	print x11-fonts
MASTER_SITES=	http://ftp.ctex.org/pub/tex/fonts/type1/
DISTNAME=	cmps
EXTRACT_SUFX=	-unix.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Computer Modern PostScript Fonts (Adobe Type 1 format)
LICENSE=	other
# freely available but not exactly public dom

.if !defined(WITHOUT_X11)
BUILD_DEPENDS=	${LOCALBASE}/bin/type1inst:${PORTSDIR}/x11-fonts/p5-type1inst
.endif

WRKSRC=		${WRKDIR}/cmpsfont
PLIST_SUB=	PLIST_X11=${PLIST_X11}

.if !defined(WITHOUT_X11)
PLIST_X11=	""
SUB_FILES=	pkg-message
.else
PLIST_X11=	"@comment "
.endif

FONTSDIR=	share/fonts/${PORTNAME}

do-build:
.if !defined(WITHOUT_X11)
	${TOUCH} ${WRKSRC}/pfb/fonts.dir
	(cd ${WRKSRC}/pfb; ${LOCALBASE}/bin/type1inst -nolog -quiet)
.else
	@${DO_NADA}
.endif

do-install:
	${MKDIR} ${PREFIX}/${FONTSDIR}/afm
	${INSTALL_DATA} ${WRKSRC}/afm/* ${PREFIX}/${FONTSDIR}/afm
	${MKDIR} ${PREFIX}/${FONTSDIR}/type1
	${INSTALL_DATA} ${WRKSRC}/pfb/* ${PREFIX}/${FONTSDIR}/type1
	${INSTALL_DATA} \
		${WRKSRC}/READ.ME ${WRKSRC}/cmsample.tex \
		${PREFIX}/${FONTSDIR}/

.if !defined(WITHOUT_X11)
post-install:
	@${CAT} ${PKGMESSAGE}
.endif

.include <bsd.port.mk>
