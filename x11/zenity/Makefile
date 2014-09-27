# $MidnightBSD$

PORTNAME=	zenity
PORTVERSION=	2.32.1
PORTREVISION=	8
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display GNOME dialogs from the command line

LICENSE=	lgpl

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USES=		pathfix perl5 gettext gmake pkgconfig tar:bzip2
USE_PERL5=	run
USE_GNOME=	gnomeprefix gtk20 gnomedocutils intlhack
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lintl

CONFLICTS=	gtkada-1.2.*

OPTIONS_DEFINE=	NOTIFY
OPTIONS_DEFAULT=NOTIFY

NOTIFY_LIB_DEPENDS=	libnotify.so:${PORTSDIR}/devel/libnotify
NOTIFY_CONFIGURE_ENABLE=	libnotify

.include <bsd.port.mk>
