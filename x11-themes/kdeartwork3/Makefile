# $MidnightBSD: mports/x11-themes/kdeartwork3/Makefile,v 1.4 2009/05/08 22:17:42 laffer1 Exp $

PORTNAME=	kdeartwork
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	x11-themes kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional themes, sounds, wallpapers and window styles for KDE
LICENSE=	gpl2

CONFLICTS=	phase-[0-9]* kde-windeco-smoothblend-[0.9]*

USE_KDEBASE_VER=3
PREFIX=		${KDE_PREFIX}

USE_GL=		yes
USE_BZIP2=	yes
USE_GMAKE=	yes

USE_AUTOTOOLS=  libtool:22
USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/bin/xscreensaver)
WITH_XS=	yes
.endif # exists(${LOCALBASE}/bin/xscreensaver)

.if exists(${LOCALBASE}/share/gnome/control-center-2.0/capplets/screensaver-properties.desktop)
WITH_XSGNOME=	yes
.endif # exists(${LOCALBASE}/bin/screensaver-properties-capplet)

.if defined(WITH_XS) && !defined(WITH_XSGNOME)
RUN_DEPENDS+=	kxsconfig:${PORTSDIR}/x11/xscreensaver-kde
.endif # defined(WITH_XS)

.if defined(WITH_XSGNOME)
RUN_DEPENDS+=	kxsconfig:${PORTSDIR}/x11/xscreensaver-kde
.endif # defined(WITH_XSGNOME)

pre-configure:
	@${REINPLACE_CMD} -e 's|kxsconfig||g' ${WRKSRC}/kscreensaver/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e 's|.*XSCREENSAVER.*||g' ${WRKSRC}/config.h

.include <bsd.port.post.mk>
