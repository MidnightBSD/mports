# $MidnightBSD: mports/graphics/kuickshow/Makefile,v 1.3 2009/09/20 01:43:35 laffer1 Exp $
# $FreeBSD: ports/graphics/kuickshow/Makefile,v 1.20 2006/09/12 23:26:18 lofi Exp $

PORTNAME=	kuickshow
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdegraphics-
DISTNAME=	kdegraphics-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE image viewer
LICENSE=	gpl2

CONFLICTS=	kdegraphics-3.1.* kdegraphics-3.2.[0-3]

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool:22
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/kdegraphics-${PORTVERSION}
USE_LDCONFIG=	yes

USE_GNOME=	imlib

pre-configure:
	${ECHO_CMD} ${PORTNAME} doc > ${WRKSRC}/inst-apps
	${REINPLACE_CMD} \
	's|^SUBDIRS =.*${PORTNAME}.*$$|SUBDIRS =\. ${PORTNAME}|g' \
		${WRKSRC}/doc/Makefile.in

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
