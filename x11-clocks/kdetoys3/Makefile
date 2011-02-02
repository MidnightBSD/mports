# $FreeBSD: ports/x11-clocks/kdetoys3/Makefile,v 1.64 2006/09/12 23:26:50 lofi Exp $
# $MidnightBSD: mports/x11-clocks/kdetoys3/Makefile,v 1.5 2011/01/02 17:53:50 laffer1 Exp $

PORTNAME=	kdetoys
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	x11-clocks kde misc
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small applications for KDE
LICENSE=        gpl2
USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool
USE_GMAKE=	yes

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
