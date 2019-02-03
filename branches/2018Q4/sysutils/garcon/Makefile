# $MidnightBSD$

PORTNAME=	garcon
PORTVERSION=	0.4.0
CATEGORIES=	sysutils xfce
MASTER_SITES=	XFCE
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce 4 essential utilities and scripts

# garcon's source code is licensed under GPLv2, while its
# documentation is under GFDL 1.1.
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=	gmake libtool pathfix pkgconfig gettext-tools xfce tar:bzip2
USE_GNOME=	glib20 gtk20 intltool intlhack
USE_XFCE=	libmenu

CONFIGURE_ARGS=--without-html-dir

OPTIONS_DEFINE=		NLS
NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_SUB=	yes

.include <bsd.port.mk>
