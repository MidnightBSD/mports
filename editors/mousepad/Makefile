# New ports collection makefile for:	mousepad
# Date created:		19 April 2006
# Whom:			Oliver Lehmann <oliver@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/editors/mousepad/Makefile,v 1.9 2008/06/06 13:25:52 edwin Exp $
#

PORTNAME=	mousepad
PORTVERSION=	0.3.0
CATEGORIES=	editors xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple xfce editor

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USES=	desktop-file-utils gettext gmake pathfix pkgconfig perl5
USE_GNOME=	glib20 gtk20 intltool intlhack gtksourceview2
USE_XFCE=	configenv

OPTIONS_DEFINE=	DBUS
OPTIONS_DEFAULT=	DBUS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDBUS}
LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=--enable-dbus
.else
CONFIGURE_ARGS+=--disable-dbus
.endif

.include <bsd.port.mk>
