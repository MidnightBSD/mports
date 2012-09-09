# $MidnightBSD: mports/devel/imake/Makefile,v 1.7 2012/02/28 03:41:19 laffer1 Exp $

PORTNAME=	imake
PORTVERSION=	1.0.4
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Imake and other utilities from X.Org
LICENSE=	x11

BUILD_DEPENDS=	gccmakedep:${PORTSDIR}/devel/gccmakedep \
		makedepend:${PORTSDIR}/devel/makedepend \
		${LOCALBASE}/lib/X11/config/xorg.cf:${PORTSDIR}/x11/xorg-cf-files

GNU_CONFIGURE=	yes
USE_PERL5=	yes
USE_PKGCONFIG=	yes

XORG_CAT=	util
USE_XORG=	xproto

.ifdef USE_IMAKE
.error You have `USE_IMAKE' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

MAN1= 		ccmakedep.1 \
		cleanlinks.1 \
		imake.1 \
		makeg.1 \
		mergelib.1 \
		mkdirhier.1 \
		mkhtmlindex.1 \
		revpath.1 \
		xmkmf.1

post-patch:
	@${PERL} -pi -e 's,^#!/usr/bin/perl,#!${PERL},' ${WRKSRC}/mkhtmlindex.pl

.include <bsd.port.mk>
