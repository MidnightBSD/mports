# $MidnightBSD$

PORTNAME=	cantarell-fonts
PORTVERSION=	0.0.15
CATEGORIES=	x11-fonts gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cantarell, a Humanist sans-serif font family

LICENSE=	other

LIB_DEPENDS=	fontconfig:${PORTSDIR}/x11-fonts/fontconfig

USES=		gmake pkgconfig tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-configdir=${PREFIX}/etc/fonts/conf.avail
FONTSDIR=	share/fonts/cantarell
PLIST_SUB=	FONTSDIR=${FONTSDIR}

post-install:
	@${LOCALBASE}/bin/fc-cache -f -v ${PREFIX}/${FONTSDIR}

.include <bsd.port.mk>
