# New ports collection makefile for: midnightbsd-desktop
# Date created:		July 4, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/misc/midnightbsd-desktop/Makefile,v 1.6 2011/01/15 04:05:40 laffer1 Exp $
#

PORTNAME=	midnightbsd-desktop
PORTVERSION=	1.5
CATEGORIES=	misc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD desktop environment
LICENSE=	agg

# needs firefox ?
# gimp:${PORTSDIR}/graphics/gimp-app \
# gdm:${PORTSDIR}/x11/gdm \

RUN_DEPENDS=	startkde:${PORTSDIR}/x11/kde-lite \
		bash:${PORTSDIR}/shells/bash \
		kword:${PORTSDIR}/editors/koffice-kde3 \
		smbd:${PORTSDIR}/net/samba34 \
		cupsd:${PORTSDIR}/print/cups-base \
		pidgin:${PORTSDIR}/net-im/pidgin \
		${LOCALBASE}/etc/rc.d/bsdstats.sh:${PORTSDIR}/sysutils/bsdstats \
		${LOCALBASE}/share/wallpapers/mnbsd_bg_gray.png:${PORTSDIR}/x11-themes/midnightbsd-backgrounds \
		browser:${PORTSDIR}/www/browser3

USE_XORG=	x11
USE_PERL5_RUN=	yes
USE_PYTHON_RUN=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:
	${MKDIR} ${PREFIX}/etc/dm/Sessions
	${CP} ${FILESDIR}/kde.desktop ${PREFIX}/etc/dm/Sessions
	${CP} ${FILESDIR}/etoile.desktop ${PREFIX}/etc/dm/Sessions

.include <bsd.port.mk>
