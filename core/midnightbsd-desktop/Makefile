# Created By:	Lucas Holt <luke@midnightbsd.org>

PORTNAME=	midnightbsd-desktop
PORTVERSION=	2.6.0
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	bsd2

# needs firefox ?
# gimp:${PORTSDIR}/graphics/gimp-app \

RUN_DEPENDS=	${LOCALBASE}/bin/iconv:converters/libiconv \
		${LOCALBASE}/etc/dm/Sessions/XFce4.desktop:x11-wm/xfce4 \
		bash:shells/bash \
		${LOCALBASE}/etc/rc.d/bsdstats:sysutils/bsdstats \
		${LOCALBASE}/share/wallpapers/mnbsd_bg_gray.png:x11-themes/midnightbsd-backgrounds \
		midori:www/midori \
		common-services>=1.0:core/common-services \
		${LOCALBASE}/bin/Xorg:x11-servers/xorg-server \
		${LOCALBASE}/libdata/xorg/apps:x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:x11-drivers/xorg-drivers \
		mport-manager:ports-mgmt/mport-manager \
		git:devel/git \
		wifimgr:net-mgmt/wifimgr \
		xscreensaver:x11/xscreensaver

USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:  # empty

.include <bsd.port.mk>
