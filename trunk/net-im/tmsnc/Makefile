# $MidnightBSD: mports/net-im/tmsnc/Makefile,v 1.1 2007/03/27 02:59:57 archite Exp $

PORTNAME=	tmsnc
PORTVERSION=	0.3.2
CATEGORIES=	net-im
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A textbased (console) MSN client
LICENSE=	other

# this port need ncurses 5.4
BUILD_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses
RUN_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses

GNU_CONFIGURE=	yes

MAN1=		tmsnc.1

.include <bsd.port.mk>
