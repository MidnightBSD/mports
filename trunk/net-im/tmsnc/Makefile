# $MidnightBSD: mports/net-im/tmsnc/Makefile,v 1.2 2009/06/28 00:08:06 laffer1 Exp $

PORTNAME=	tmsnc
PORTVERSION=	0.3.2
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}/Source%20code%20and%20binaries/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A textbased (console) MSN client
LICENSE=	other

# this port need ncurses 5.4
BUILD_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses
RUN_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses

GNU_CONFIGURE=	yes

MAN1=		tmsnc.1

.include <bsd.port.mk>
