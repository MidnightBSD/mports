# $MidnightBSD$
# $FreeBSD: ports/deskutils/planner/Makefile,v 1.45 2007/05/19 20:01:49 flz Exp $
#   $MCom: ports/deskutils/planner/Makefile,v 1.1 2005/10/08 19:33:55 marcus Exp $

PORTNAME=	planner
PORTVERSION=	0.14.3
#PORTREVISION=	4
CATEGORIES=	deskutils gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/0.14
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Project management application for GNOME 2

LICENSE=	gpl2

USES=		gettext gmake tar:bzip2
USE_XLIB=	yes
USE_GNOME=	gnomeprefix intlhack libgnomeui libgnomeprintui \
		libgsf
WANT_GNOME=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--disable-python \
		--disable-dotnet
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	planner.schemas

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mlibgda2}!=""
USE_GNOME+=	libgda2
CONFIGURE_ARGS+=--enable-database=yes
PLIST_SUB+=	GDA=""
.else
PLIST_SUB+=	GDA="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]datadir[)]/doc|(prefix)/share/doc|g'

post-install:
	@-update-desktop-database

.include <bsd.port.post.mk>
