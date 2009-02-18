# $MidnightBSD$

PORTNAME=	kdbg
PORTVERSION=	2.1.1
CATEGORIES=	devel kde
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphical user interface around gdb using KDE
LICENSE=	gpl2

USE_KDELIBS_VER=	3
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--with-kde-version=3

#.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
