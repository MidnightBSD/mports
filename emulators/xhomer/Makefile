# New ports collection makefile for:	xhomer
# Date created:			24 May 2006
# Whom:				trasz
#

#

PORTNAME=	xhomer
DISTVERSION=	9-16-06
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	http://xhomer.isani.org/xhomer/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emulator for the DEC Pro 350 computer

LICENSE=	agg

USES=		gmake
USE_XORG=	xt sm ice xext x11
ALL_TARGET=	clean xhomer
INSTALL_TARGET=
CFLAGS+=	-Wall -ffloat-store
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PLIST_FILES=	bin/xhomer %%EXAMPLESDIR%%/xhomer.cfg
PLIST_DIRS=	%%EXAMPLESDIR%%
PORTDOCS=	README LICENSE SIMH

MAKE_JOBS_UNSAFE=	yes

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/xhomer ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/xhomer.cfg ${EXAMPLESDIR}

.include <bsd.port.mk>
