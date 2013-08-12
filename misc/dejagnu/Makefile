# $MidnightBSD: mports/misc/dejagnu/Makefile,v 1.3 2013/02/22 03:00:13 laffer1 Exp $

PORTNAME=	dejagnu
PORTVERSION=	1.5.1
CATEGORIES=	misc tcl tk
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automated program/system tester

LICENSE=	gpl3

BUILD_DEPENDS=	expect:${PORTSDIR}/lang/expect
RUN_DEPENDS=	expect:${PORTSDIR}/lang/expect

USE_GMAKE=	yes
GNU_CONFIGURE=	yes

USE_TCL=	yes

MAN1=		runtest.1

.include <bsd.port.mk>
