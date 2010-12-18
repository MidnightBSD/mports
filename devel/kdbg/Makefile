# $MidnightBSD: mports/devel/kdbg/Makefile,v 1.2 2009/09/20 00:28:39 laffer1 Exp $

PORTNAME=	kdbg
PORTVERSION=	2.2.0
PORTREVISION=	2
CATEGORIES=	devel kde
MASTER_SITES=	SF/${PORTNAME}/Source%20Code/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphical user interface around gdb using KDE
LICENSE=	gpl2

USE_KDELIBS_VER=	3
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--with-kde-version=3

.include <bsd.port.mk>
