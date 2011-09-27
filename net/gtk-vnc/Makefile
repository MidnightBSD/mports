# $MidnightBSD: mports/net/gtk-vnc/Makefile,v 1.1 2010/09/06 19:54:53 laffer1 Exp $

PORTNAME=	gtk-vnc
PORTVERSION=	0.3.10
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC viewer widget for GTK+
LICENSE=	lgpl

LIB_DEPENDS=	gnutls:${PORTSDIR}/security/gnutls \
		gcrypt.17:${PORTSDIR}/security/libgcrypt \
		sasl2.2:${PORTSDIR}/security/cyrus-sasl2 \
		gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

USE_GNOME=	pygtk2 gnomehack
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-gtkglext=yes

.include <bsd.port.mk>
