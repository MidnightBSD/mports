# Created by: Danilo Egea Gondolfo <danilogondolfo@gmail.com>

PORTNAME=	xfce4-diskperf-plugin
PORTVERSION=	2.6.3
PORTREVISION=	1
CATEGORIES=	sysutils xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical representation of the disk IO

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext-tools gnome gmake libtool pkgconfig \
		tar:bzip2 xfce
USE_GNOME=	cairo gtk30 intltool
USE_XFCE=	panel

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

LIBS+=		-ldevstat

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} -e 's|[[:blank:]]po||' \
		-e 's|po$$||'  ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
