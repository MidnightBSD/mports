# New ports collection makefile for:	tmsnc
# Date created:				10 Sep 2005
# Whom:					Tsung-Han Yeh <snowfly@yuntech.edu.tw>
#
# $MidnightBSD$
# $FreeBSD: ports/net-im/tmsnc/Makefile,v 1.4 2005/12/26 22:35:53 pav Exp $
#

PORTNAME=	tmsnc
PORTVERSION=	0.3.1
CATEGORIES=	net-im
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A textbased (console) MSN client

# this port need ncurses 5.4
BUILD_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses
RUN_DEPENDS+=	${LOCALBASE}/include/ncurses/ncurses.h:${PORTSDIR}/devel/ncurses

GNU_CONFIGURE=	yes

MAN1=		tmsnc.1

.include <bsd.port.mk>
