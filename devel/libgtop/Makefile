# New ports collection makefile for:	libgtop2
# Date Created:			29 April 2002
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libgtop/Makefile,v 1.6 2010/01/02 01:02:39 laffer1 Exp $
# $FreeBSD: ports/devel/libgtop/Makefile,v 1.76 2007/07/23 09:35:42 rafan Exp $
#   $MCom: ports/devel/libgtop/Makefile,v 1.5 2006/10/02 23:26:51 ahze Exp $
#

PORTNAME=	libgtop
PORTVERSION=	2.26.1
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
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
CONFIGURE_TARGET=--build=${ARCH}-portbld-freebsd7.0 \
		 --host=${ARCH}-portbld-freebsd7.0 \
		 --target=${ARCH}-portbld-freebsd7.0

INFO=		libgtop2

PKGMESSAGE=	${FILESDIR}/pkg-message

.include <bsd.port.pre.mk>

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

post-install:
	@${CHGRP} kmem ${PREFIX}/bin/libgtop_server2
	@${CHMOD} 2555 ${PREFIX}/bin/libgtop_server2

.include <bsd.port.post.mk>
