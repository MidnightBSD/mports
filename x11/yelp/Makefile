# $MidnightBSD: mports/x11/yelp/Makefile,v 1.15 2011/07/09 16:51:29 laffer1 Exp $

PORTNAME=	yelp
PORTVERSION=	2.30.2
PORTREVISION=	2
CATEGORIES=	x11 gnome
MASTER_SITES=	FREEBSD_LOCAL/kwm
DISTNAME=	${PORTNAME}-webkit-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A help browser for the GNOME 2 desktop
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib \
		startup-notification-1:${PORTSDIR}/x11/startup-notification \
		webkitgtk-1.0:${PORTSDIR}/www/webkit-gtk2 \
		rarian:${PORTSDIR}/textproc/rarian

CONFLICTS=	yelp-3.[0-9]*

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	ice
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gnomedocutils
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	yelp.schemas

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
LDFLAGS+=	-fstack-protector
.endif

post-extract:
	${RM} -f ${WRKSRC}/data/yelp.schemas

post-patch:
	@${REINPLACE_CMD} -e 's,[-/]unstable,,' \
		-e 's/ --define-variable=includetype=unstable//' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
