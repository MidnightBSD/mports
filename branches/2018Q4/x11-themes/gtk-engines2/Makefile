# $MidnightBSD$

PORTNAME=	gtk-engines2
PORTVERSION=	2.20.2
PORTREVISION=	2
CATEGORIES=	x11-themes
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theme engine for the GTK+-2.0 toolkit

LICENSE=	gpl2 
# this has LGPL and GPLv2 code in it.

CONFLICTS=	gtk-smooth-engine-[0-9]* clearlooks-[0-9]*

USE_GNOME=	gtk20 intlhack
USES=		gettext gmake libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	ANIMATION
ANIMATION_DESC=	Experimental animated progressbars

ANIMATION_CONFIGURE_ENABLE=	animation

post-patch:
	@${REINPLACE_CMD} -e 's|glib.*\.h>|glib.h>|g' \
		${WRKSRC}/engines/clearlooks/src/animation.c

post-install:
	@(cd ${WRKSRC}/po && ${GMAKE} install)

.include <bsd.port.mk>
