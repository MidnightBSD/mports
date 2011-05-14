# $MidnightBSD: mports/misc/dejagnu/Makefile,v 1.1 2010/01/17 14:29:00 laffer1 Exp $

PORTNAME=	dejagnu
PORTVERSION=	1.5
CATEGORIES=	misc tcl tk
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automated program/system tester
LICENSE=	gpl3

BUILD_DEPENDS=	expect:${PORTSDIR}/lang/expect
RUN_DEPENDS=	expect:${PORTSDIR}/lang/expect

USE_GMAKE=	yes
GNU_CONFIGURE=	yes

MAN1=		runtest.1

.include <bsd.port.mk>
