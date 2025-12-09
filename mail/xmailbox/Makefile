PORTNAME=	xmailbox
PORTVERSION=	2.5
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	XCONTRIB/applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mailbox checker with sound and animation for X Window System

LICENSE=	mit

USES=		imake xorg
USE_XORG=	xaw

OPTIONS_DEFINE=	DOCS

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/XMailbox.ad

post-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/dingdong.au ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/ugotmail.au ${STAGEDIR}${DATADIR}
	${MKDIR} ${PREFIX}/share/man

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/DISCLAIMER ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
