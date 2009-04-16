# $MidnightBSD: mports/mbone/xspeakfree/Makefile,v 1.1 2007/04/05 00:41:04 laffer1 Exp $

PORTNAME=	xspeakfree
PORTVERSION=	0.8.2
CATEGORIES=	mbone net audio
MASTER_SITES=	http://www.liquidx.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tcl/Tk (wish) frontend to Speak Freely
LICENSE=	agg

RUN_DEPENDS=	${LOCALBASE}/bin/sfmike:${PORTSDIR}/mbone/speak_freely

USE_TK=		84

NO_BUILD=	yes
PORTDOCS=	BUGS HISTORY INSTALL LICENSE README TODO

post-patch:
	@${REINPLACE_CMD} -e 's|wish|wish8.4|' ${WRKSRC}/bin/xspeakfree

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/xspeakfree ${PREFIX}/bin/xspeakfree
	${MKDIR} ${PREFIX}/lib/xspeakfree
	${INSTALL_DATA} ${WRKSRC}/lib/xspeakfree/* ${PREFIX}/lib/xspeakfree
	${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
