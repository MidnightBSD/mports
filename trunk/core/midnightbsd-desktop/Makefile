# Created By:	Lucas Holt <luke@midnightbsd.org>
# $MidnightBSD$

PORTNAME=	midnightbsd-desktop
PORTVERSION=	1.8
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	agg

# needs firefox ?
# gimp:${PORTSDIR}/graphics/gimp-app \
# gdm:${PORTSDIR}/x11/gdm \

RUN_DEPENDS=	wmaker:${PORTSDIR}/x11-wm/windowmaker \
		bash:${PORTSDIR}/shells/bash \
		pidgin:${PORTSDIR}/net-im/pidgin \
		${LOCALBASE}/etc/rc.d/bsdstats.sh:${PORTSDIR}/sysutils/bsdstats \
		${LOCALBASE}/share/wallpapers/mnbsd_bg_gray.png:${PORTSDIR}/x11-themes/midnightbsd-backgrounds \
		browser:${PORTSDIR}/www/browser3 \
		common-services>=1.0:${PORTSDIR}/core/common-services \
		${LOCALBASE}/bin/Xorg:${PORTSDIR}/x11-servers/xorg-server \

USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/etc/dm/Sessions
	${CP} ${FILESDIR}/etoile.desktop ${PREFIX}/etc/dm/Sessions

.include <bsd.port.mk>
