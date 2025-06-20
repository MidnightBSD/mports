PORTNAME=	xmailbox
PORTVERSION=	2.5
CATEGORIES=	mail
MASTER_SITES=	XCONTRIB/applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mailbox checker with sound and animation for X Window System

USES=		imake xorg
USE_XORG=	xaw

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/XMailbox.ad

post-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/dingdong.au ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/ugotmail.au ${STAGEDIR}${DATADIR}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/DISCLAIMER ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}
	${MKDIR} ${PREFIX}/share/man
	${CP} ${PREFIX}/man/man1/* ${PREFIX}/share/man/man1/

.include <bsd.port.mk>
