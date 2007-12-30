# -*-mode: makefile-*-
# New ports collection makefile for:	kdeadmin
# Date created:				2 November 2001
# Whom:					will@cvs.kde.org
#
# $FreeBSD: ports/sysutils/kdeadmin3/Makefile,v 1.45 2006/09/12 23:26:46 lofi Exp $
# $MidnightBSD: mports/sysutils/kdeadmin3/Makefile,v 1.1 2007/01/25 21:17:26 laffer1 Exp $
#

PORTNAME=	kdeadmin
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	sysutils kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE applications related to system administration

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool:15

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib/kde3

post-patch:
	${REINPLACE_CMD} -e \
	's|pkgconfigdir =.*|pkgconfigdir = ${LOCALBASE}/libdata/pkgconfig|g' \
		${WRKSRC}/knetworkconf/backends/Makefile.in
	${REINPLACE_CMD} -e 's|INDEX-5|${INDEXFILE}|g' \
		${WRKSRC}/kpackage/fbsdInterface.cpp

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
