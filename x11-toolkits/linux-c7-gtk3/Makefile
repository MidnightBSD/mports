PORTNAME=	gtk3
PORTVERSION=	3.22.30
DISTVERSIONSUFFIX=	-8.el7_9
PORTREVISION=	4
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK library, version 3.X (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.gtk.org/

LICENSE=	lgpl3

RUN_DEPENDS=	hicolor-icon-theme>0:misc/hicolor-icon-theme \
		adwaita-icon-theme>0:x11-themes/adwaita-icon-theme

USES=		cpe linux:c7
CPE_VENDOR=	gnome
CPE_PRODUCT=	gtk
USE_LDCONFIG=	yes
USE_LINUX=	at-spi2-atk atk cairo-gobject fontconfig freetype gdkpixbuf2 \
		libepoxy librsvg2 libxkbcommon pango wayland xorglibs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${DISTNAME} \
		${PORTNAME}-immodules-${DISTVERSIONFULL}

DESCR=		${.CURDIR}/../${PORTNAME}0/pkg-descr

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.mk>
