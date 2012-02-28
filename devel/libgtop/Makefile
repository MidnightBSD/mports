# $MidnightBSD: mports/devel/libgtop/Makefile,v 1.12 2011/08/20 13:40:57 laffer1 Exp $

PORTNAME=	libgtop
PORTVERSION=	2.28.2
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 top library
LICENSE=	gpl2

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	lsof:${PORTSDIR}/sysutils/lsof
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_BZIP2=	yes
USE_PERL5_BUILD=yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20 ltverhack intlhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -DHAVE_NET_IF_VAR_H" \
		LDFLAGS="-L${LOCALBASE}/lib -lgeom -ldevstat"
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
CFLAGS+=	-D__FreeBSD_version=700055

INFO=		libgtop2

PKGMESSAGE=	${FILESDIR}/pkg-message

.include <bsd.port.pre.mk>

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

post-install:
	@${CHGRP} kmem ${PREFIX}/bin/libgtop_server2
	@${CHMOD} 2555 ${PREFIX}/bin/libgtop_server2

.include <bsd.port.post.mk>
