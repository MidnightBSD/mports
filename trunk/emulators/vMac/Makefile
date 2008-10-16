# New ports collection makefile for:	vMac
# Date created:				Jul 11th 1999
# Whom:					troll
#
# $MidnightBSD: mports/emulators/vMac/Makefile,v 1.2 2007/04/26 01:42:11 ctriv Exp $
# $FreeBSD: ports/emulators/vMac/Makefile,v 1.9 2006/12/06 13:50:42 rafan Exp $
#

PORTNAME=		vMac
PORTVERSION=		0.1.9.3
PORTREVISION=	1
CATEGORIES=		emulators
MASTER_SITES=		http://www.vmac.org/download/XWindows/
DISTNAME=		${PORTNAME}-${PORTVERSION}-src
EXTRACT_SUFX=		.tgz

MAINTAINER=		ports@MidnightBSD.org
COMMENT=	Emulates a MacPlus machine!  Runs MacOS versions up to 7.5.5
LICENSE=	other

WRKSRC=			${WRKDIR}/${PORTNAME}-${PORTVERSION}
SUB_FILES=		pkg-message
USE_GMAKE=	 	yes
GNU_CONFIGURE=		yes
USE_XLIB=		yes

pre-patch:
	(cd ${WRKSRC} && ${SH} ${FILESDIR}/dos2unx gemulator.c)

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vMac \
	    ${PREFIX}/bin
	@${STRIP_CMD} ${PREFIX}/bin/vMac
.if !defined(NOPORTDOCS)
	@ ${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/CREDITS \
	    ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL \
	    ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENSE \
	    ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README \
	    ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.rom \
	    ${DOCSDIR}
.endif


.include <bsd.port.mk>
