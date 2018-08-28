# Created By:	Lucas Holt <luke@midnightbsd.org>
# $MidnightBSD$

PORTNAME=	midnightbsd-desktop
PORTVERSION=	2.1
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	bsd2

# needs firefox ?
# gimp:${PORTSDIR}/graphics/gimp-app \

RUN_DEPENDS=	wmaker:${PORTSDIR}/x11-wm/windowmaker \
		bash:${PORTSDIR}/shells/bash \
		pidgin:${PORTSDIR}/net-im/pidgin \
		${LOCALBASE}/etc/rc.d/bsdstats.sh:${PORTSDIR}/sysutils/bsdstats \
		${LOCALBASE}/share/wallpapers/mnbsd_bg_gray.png:${PORTSDIR}/x11-themes/midnightbsd-backgrounds \
		midori:${PORTSDIR}/www/midori \
		common-services>=1.0:${PORTSDIR}/core/common-services \
		${LOCALBASE}/bin/Xorg:${PORTSDIR}/x11-servers/xorg-server \
		${LOCALBASE}/libdata/xorg/apps:${PORTSDIR}/x11/xorg-apps \
                ${LOCALBASE}/libdata/xorg/libraries:${PORTSDIR}/x11/xorg-libraries \
                ${LOCALBASE}/libdata/xorg/fonts:${PORTSDIR}/x11-fonts/xorg-fonts
 \
                ${LOCALBASE}/libdata/xorg/drivers:${PORTSDIR}/x11-drivers/xorg-drivers \
		mport-manager:${PORTSDIR}/ports-mgmt/mport-manager \
		mlogind:${PORTSDIR}/x11/mlogind


USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/share/xsessions
	${CP} ${FILESDIR}/etoile.desktop ${PREFIX}/share/xsessions/
	${CP} ${FILESDIR}/windowmaker.desktop ${PREFIX}/share/xsessions/

.include <bsd.port.mk>
