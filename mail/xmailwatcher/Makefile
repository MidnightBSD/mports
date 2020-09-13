# Created by: Harry Newton

PORTNAME=	xmailwatcher
PORTVERSION=	1.6
CATEGORIES=	mail
MASTER_SITES=	http://www.dcs.ed.ac.uk/home/gdmr/X11/
DISTNAME=	xmailwatcher

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mailbox checker which displays sender and subject lines of mails

LICENSE=	mit

PLIST_FILES=	bin/xmailwatcher man/man1/xmailwatcher.1.gz
USES=		imake
USE_XORG=	ice sm x11 xaw xext xmu xpm xt

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/xmailwatcher

.include <bsd.port.mk>
