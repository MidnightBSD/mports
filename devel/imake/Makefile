# $MidnightBSD: mports/devel/imake/Makefile,v 1.8 2012/09/09 00:46:12 laffer1 Exp $

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

MAN1=		ccmakedep.1 \
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

.include <bsd.port.pre.mk>

# clang's cpp destroys whitespace, particularly hard tabs in makefiles,
# which is fatal for imake.
.if defined(CC) && ${CC} == "clang"
BUILD_DEPENDS+=	ucpp:${PORTSDIR}/devel/ucpp
RUN_DEPENDS+=	ucpp:${PORTSDIR}/devel/ucpp
CONFIGURE_ENV+=	ac_cv_path_RAWCPP="ucpp -s"

post-build:
	${REINPLACE_CMD} -e 's|^configdirspec= *|configdirspec=|' ${WRKSRC}/xmkmf
.endif

.include <bsd.port.post.mk>
