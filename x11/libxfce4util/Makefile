# $MidnightBSD$
# $FreeBSD: ports/x11/libxfce4util/Makefile,v 1.35 2008/06/06 14:09:04 edwin Exp $

PORTNAME=	libxfce4util
PORTVERSION=	4.12.1
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension library for the Xfce desktop environment

LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix pkgconfig gettext-tools \
	xfce tar:bzip2
USE_GNOME=	glib20 intltool intlhack
USE_LDCONFIG=	yes
USE_PERL5=	yes

CONFIGURE_ARGS=--without-html-dir

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.mk>
