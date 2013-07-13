# $MidnightBSD: mports/sysutils/system-tools-backends/Makefile,v 1.5 2011/01/14 14:44:12 laffer1 Exp $

PORTNAME=	system-tools-backends
PORTVERSION=	2.10.1
PORTREVISION=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backend system admin scripts for gnome-system-tools

LICENSE=        lgpl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DBus.pm:${PORTSDIR}/devel/p5-Net-DBus
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		polkit-gobject-1.0:${PORTSDIR}/sysutils/polkit
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DBus.pm:${PORTSDIR}/devel/p5-Net-DBus

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5=	yes
USE_GNOME=	gnomehack intlhack glib20
GNU_CONFIGURE=	yes
USE_GNOME_SUBR=	yes
CONFIGURE_ARGS=	--with-stb-group=wheel \
		--localstatedir=/var
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-configure:
	@${REINPLACE_CMD} -e 's|@GETTEXT_PACKAGE@|system-tools-backends|g' \
		${WRKSRC}/po/Makefile

.include <bsd.port.mk>
