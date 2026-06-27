PORTNAME=	midnightbsd-desktop
PORTVERSION=	2.6.7
PORTREVISION=	1
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	MidnightBSD desktop environment
WWW=		http://www.midnightbsd.org/

LICENSE=	bsd2

# gimp:graphics/gimp-app \

RUN_DEPENDS=	${LOCALBASE}/bin/iconv:converters/libiconv \
		${LOCALBASE}/share/xsessions/xfce.desktop:x11-wm/xfce4 \
		abiword:editors/abiword \
		file-roller:archivers/file-roller \
		bash:shells/bash \
		${LOCALBASE}/etc/rc.d/bsdstats:sysutils/bsdstats \
		${LOCALBASE}/share/backgrounds/midnightbsd/mnbsd_bg_gray.png:x11-themes/midnightbsd-backgrounds \
		evince:graphics/evince \
		firefox:www/firefox \
		raphael:www/raphael \
		common-services>=1.0:core/common-services \
		${LOCALBASE}/bin/Xorg:x11-servers/xorg-server@xorg \
		${LOCALBASE}/libdata/xorg/apps:x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:x11-drivers/xorg-drivers \
		noto>=0:x11-fonts/noto \
		mport-manager:ports-mgmt/mport-manager \
		parole:multimedia/xfce4-parole \
		git:devel/git \
		ristretto:graphics/ristretto \
		shared-mime-info>=0:misc/shared-mime-info \
		wifimgr:net-mgmt/wifimgr \
		xscreensaver:x11/xscreensaver \
		update-desktop-database:devel/desktop-file-utils \
		gconftool-2:devel/gconf2 \
		dialog4ports:ports-mgmt/dialog4ports \
		evolution>=0:mail/evolution \
		gnumeric:math/gnumeric \
		xdg-utils>=0:devel/xdg-utils \
		xconfig>=0:x11/xconfig

USES=		perl5 python:run

USE_GSTREAMER1=	ogg theora vorbis

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
	${CP} ${FILESDIR}/xfce4-desktop.xml ${PREFIX}/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/

.include <bsd.port.mk>
