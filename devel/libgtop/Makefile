# New ports collection makefile for:	libgtop2
# Date Created:			29 April 2002
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libgtop/Makefile,v 1.4 2008/10/03 03:33:43 ctriv Exp $
# $FreeBSD: ports/devel/libgtop/Makefile,v 1.76 2007/07/23 09:35:42 rafan Exp $
#   $MCom: ports/devel/libgtop/Makefile,v 1.5 2006/10/02 23:26:51 ahze Exp $
#

PORTNAME=	libgtop
PORTVERSION=	2.22.2
CATEGORIES=	devel gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 top library
LICENSE=	gpl2

RUN_DEPENDS=	lsof:${PORTSDIR}/sysutils/lsof
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_BZIP2=	yes
USE_PERL5_BUILD=yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20 ltverhack intlhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

INFO=		libgtop2

.include <bsd.port.pre.mk>

PKGMESSAGE=	${FILESDIR}/pkg-message

post-install:
	@${CHGRP} kmem ${PREFIX}/bin/libgtop_server2
	@${CHMOD} 2555 ${PREFIX}/bin/libgtop_server2

.include <bsd.port.post.mk>
