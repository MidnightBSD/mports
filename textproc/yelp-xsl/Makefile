# Created by: Maxim Sobolev <sobomax@FreeBSD.org>

PORTNAME=	yelp-xsl
DISTVERSION=	40.0
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DocBook XSLT stylesheets for yelp

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LGPL

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase pathfix \
		pkgconfig tar:xz
USE_GNOME=	libxml2 libxslt
GNU_CONFIGURE=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
