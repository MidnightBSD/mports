# $MidnightBSD: mports/net-im/tmsnc/Makefile,v 1.3 2011/05/15 21:58:48 laffer1 Exp $

PORTNAME=	tmsnc
PORTVERSION=	0.3.2
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}/Source%20code%20and%20binaries/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A textbased (console) MSN client
LICENSE=	other

# this port need ncurses 5.4
BUILD_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses
RUN_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses

GNU_CONFIGURE=	yes
USE_NCURSES=	yes

MAN1=		tmsnc.1

.include <bsd.port.mk>
