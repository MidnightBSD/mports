# $MidnightBSD: mports/net/gtk-vnc/Makefile,v 1.4 2012/02/11 00:27:51 laffer1 Exp $

PORTNAME=	gtk-vnc
PORTVERSION=	0.3.10
PORTREVISION=	3
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC viewer widget for GTK+
LICENSE=	lgpl

LIB_DEPENDS=	gnutls:${PORTSDIR}/security/gnutls \
		gcrypt:${PORTSDIR}/security/libgcrypt \
		sasl2:${PORTSDIR}/security/cyrus-sasl2 \
		gtkglext-x11-1.0:${PORTSDIR}/x11-toolkits/gtkglext

CONFLICTS=	gtk-vnc-0.4.[0-9]*

USE_GNOME=	pygtk2 gnomehack
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-gtkglext=yes

.include <bsd.port.mk>
