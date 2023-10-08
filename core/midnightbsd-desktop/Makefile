# Created By:	Lucas Holt <luke@midnightbsd.org>

PORTNAME=	midnightbsd-desktop
PORTVERSION=	2.6.4
PORTREVISION=	1
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment

LICENSE=	bsd2

# needs firefox ?
# gimp:graphics/gimp-app \

USE_GSTREAMER1=	ogg theora vorbis

RUN_DEPENDS=	${LOCALBASE}/bin/iconv:converters/libiconv \
		${LOCALBASE}/share/xsessions/xfce.desktop:x11-wm/xfce4 \
		bash:shells/bash \
		${LOCALBASE}/etc/rc.d/bsdstats:sysutils/bsdstats \
		${LOCALBASE}/share/backgrounds/midnightbsd/mnbsd_bg_gray.png:x11-themes/midnightbsd-backgrounds \
		midori:www/midori \
		common-services>=1.0:core/common-services \
		${LOCALBASE}/bin/Xorg:x11-servers/xorg-server@xorg \
		${LOCALBASE}/libdata/xorg/apps:x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:x11-drivers/xorg-drivers \
		mport-manager:ports-mgmt/mport-manager \
		git:devel/git \
		wifimgr:net-mgmt/wifimgr \
		xscreensaver:x11/xscreensaver \
		gconftool-2:devel/gconf2 \
		dialog4ports:ports-mgmt/dialog4ports \
		evolution>=0:mail/evolution

USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
	${CP} ${FILESDIR}/xfce4-desktop.xml ${PREFIX}/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/

.include <bsd.port.mk>
