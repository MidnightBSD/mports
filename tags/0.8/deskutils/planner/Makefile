# $MidnightBSD$
# $FreeBSD: ports/deskutils/planner/Makefile,v 1.45 2007/05/19 20:01:49 flz Exp $
#   $MCom: ports/deskutils/planner/Makefile,v 1.1 2005/10/08 19:33:55 marcus Exp $

PORTNAME=	planner
PORTVERSION=	0.14.6
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Project management application for GNOME 2

LICENSE=	gpl2

USES=		desktop-file-utils gettext gmake libtool pathfix pkgconfig \
		shared-mime-info tar:xz
USE_GNOME=	gnomeprefix intlhack libgnomeui libgnomeprintui \
		libgsf
WANT_GNOME=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-python \
		--disable-python-plugin \
		--disable-update-mimedb
CPPFLAGS+=	-I${LOCALBASE}/include -DGLIB_COMPILATION
LIBS+=		-L${LOCALBASE}/lib

GCONF_SCHEMAS=	planner.schemas

.include <bsd.port.mk>
