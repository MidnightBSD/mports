PORTNAME=	librsvg2
PORTVERSION=	2.40.20
DISTVERSIONSUFFIX=	-1.el7
PORTREVISION=	1
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and render SVG vector graphics (CentOS ${LINUX_DIST_VER})
WWW=		https://live.gnome.org/LibRsvg

LICENSE=	gpl2

USES=		cpe linux:c7
CPE_VENDOR=	gnome
CPE_PRODUCT=	librsvg
USE_LDCONFIG=	yes
USE_LINUX=	cairo fontconfig freetype gdkpixbuf2 imageformats-libs libcroco \
		libxml2 pango
USE_LINUX_RPM=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
