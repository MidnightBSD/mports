# New ports collection makefile for:	xfce4-calendar
# Date created:		2003-01-14
# Whom:			Matt Lancereau <matt@rimasec.net>
#
# $MidnightBSD: mports/deskutils/orage/Makefile,v 1.1 2008/09/26 15:58:25 laffer1 Exp $
# $FreeBSD: ports/deskutils/orage/Makefile,v 1.12 2008/06/06 13:18:27 edwin Exp $
#

PORTNAME=	orage
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	deskutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A calendar application to manage your time with XFce 4
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui xfconf panel
USE_XORG=	xext xrender xinerama xi xrandr xcursor xcomposite xdamage x11 \
		xfixes

OPTIONS=	BDB	"Enable BDB support"		off \
		ICAL	"Enable libical support"	off

.include <bsd.port.pre.mk>

.if defined(WITH_BDB)
CONFIGURE_ARGS+=--with-bdb4=yes --with-bdb4_dir=${LOCALBASE}
USE_BDB=	40
.else
CONFIGURE_ARGS+=--with-bdb4=no
.endif

.if defined(WITH_ICAL)
LIB_DEPENDS+=	ical.27:${PORTSDIR}/devel/libical
.endif

post-patch:
.if !defined(WITH_ICAL)
	@${REINPLACE_CMD} -e 's|libical-|no-&|g' ${WRKSRC}/configure
.endif
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
