# $MidnightBSD: mports/graphics/kamera/Makefile,v 1.4 2011/01/01 16:33:37 laffer1 Exp $
# $FreeBSD: ports/graphics/kamera/Makefile,v 1.15 2006/09/12 23:26:17 lofi Exp $

PORTNAME=	kamera
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdegraphics-
DISTNAME=	kdegraphics-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Digital camera support for KDE
LICENSE=	gpl2

LIB_DEPENDS+=	gphoto2:${PORTSDIR}/graphics/libgphoto2

CONFLICTS=	kdegraphics-3.1.* kdegraphics-3.2.[0-3]

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/kdegraphics-${PORTVERSION}

pre-configure:
	${ECHO_CMD} ${PORTNAME} doc > ${WRKSRC}/inst-apps
	${REINPLACE_CMD} \
	's|^SUBDIRS =.*${PORTNAME}.*$$|SUBDIRS =\. ${PORTNAME}|g' \
		${WRKSRC}/doc/Makefile.in

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
