# $MidnightBSD$

PORTNAME=	helpviewer
PORTVERSION=	0.3
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://www.roard.com/helpviewer/download/
DISTNAME=	HelpViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Online help viewer for GNUstep programs

LICENSE=	gpl2

USES=		gnustep tar:tgz
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|Foundation/GSXML.h|GNUstepBase/GSXML.h|' \
		${WRKSRC}/HandlerStructureXLP.h \
		${WRKSRC}/TextFormatterXLP.h

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/HelpViewer.app/HelpViewer

.include <bsd.port.mk>
