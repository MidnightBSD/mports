# $MidnightBSD$

PORTNAME=	cantarell-fonts
PORTVERSION=	0.0.25
CATEGORIES=	x11-fonts gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cantarell, a Humanist sans-serif font family

LICENSE=	other

LIB_DEPENDS=	libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig

USES=		gmake pkgconfig tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-configdir=${PREFIX}/etc/fonts/conf.avail
FONTSDIR=	share/fonts/cantarell
PLIST_SUB=	FONTSDIR=${FONTSDIR}

.include <bsd.port.mk>
