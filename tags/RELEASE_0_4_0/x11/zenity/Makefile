# $MidnightBSD: mports/x11/zenity/Makefile,v 1.10 2013/04/11 01:02:29 laffer1 Exp $

PORTNAME=	zenity
PORTVERSION=	2.32.1
PORTREVISION=	4
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display GNOME dialogs from the command line
LICENSE=	lgpl

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_GMAKE=	yes
USE_PATHFIX=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20 gnomedocutils intlhack
USE_BZIP2=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
CONFIGURE_ENV=	LIBS="${PTHREAD_LIBS}"

MAN1=		zenity.1

CONFLICTS=	gtkada-1.2.*

OPTIONS_DEFINE=	NOTIFY
OPTIONS_DEFAULT=NOTIFY

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_NOTIFY)
LIB_DEPENDS+=		notify:${PORTSDIR}/devel/libnotify
CONFIGURE_ARGS+=	--enable-libnotify
.else
CONFIGURE_ARGS+=	--disable-libnotify
.endif

.include <bsd.port.mk>
