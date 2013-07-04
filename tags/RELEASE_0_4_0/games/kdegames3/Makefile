# $FreeBSD: ports/games/kdegames3/Makefile,v 1.96 2006/09/12 23:26:16 lofi Exp $
# $MidnightBSD: mports/games/kdegames3/Makefile,v 1.5 2011/02/02 21:01:20 laffer1 Exp $

PORTNAME=	kdegames
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	1
CATEGORIES=	games kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Games for the KDE integrated X11 desktop
LICENSE=	gpl2

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib

CONFIGURE_ARGS=	--disable-setgid

post-patch:
	@${REINPLACE_CMD} -e 's|root:root|${BINOWN}:${BINGRP}|g' \
				${WRKSRC}/kgoldrunner/gamedata/Makefile.in

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
