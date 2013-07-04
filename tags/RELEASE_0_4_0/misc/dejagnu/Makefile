# $MidnightBSD: mports/misc/dejagnu/Makefile,v 1.2 2011/05/14 17:18:52 laffer1 Exp $

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

USE_TCL=	83+

MAN1=		runtest.1

.include <bsd.port.mk>
