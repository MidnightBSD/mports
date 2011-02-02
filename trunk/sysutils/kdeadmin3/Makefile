# $MidnightBSD: mports/sysutils/kdeadmin3/Makefile,v 1.4 2009/09/20 02:15:26 laffer1 Exp $

PORTNAME=	kdeadmin
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	sysutils kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE applications related to system administration
LICENSE=	gpl2

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool

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
