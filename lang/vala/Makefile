# Created by: Michael Johnson <ahze@FreeBSD.org>

PORTNAME=	vala
PORTVERSION=	0.48.23
PORTEPOCH=	1
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programming language and compiler that converts Vala code into C code

LICENSE=	lgpl2.1

PORTSCOUT=	limitw:1,even

USES=		bison cpe gettext-runtime gmake gnome libtool \
		localbase pathfix pkgconfig tar:xz
USE_GNOME=	glib20 gnomeprefix libxslt:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-valadoc
INSTALL_TARGET=	install-strip
CPE_VENDOR=	gnome

PLIST_SUB=	VERSION=${PORTVERSION:R}

.include <bsd.port.mk>
