# New ports collection makefile for:    imake-6
# Date created:         18 Jun 2004
# Whom:                 anholt
#
# $MidnightBSD: mports/devel/imake-6/Makefile,v 1.4 2008/04/14 18:19:54 laffer1 Exp $
# $FreeBSD: ports/devel/imake-6/Makefile,v 1.12 2006/05/09 17:12:28 lesi Exp $
#

PORTNAME=	imake
PORTVERSION=	6.9.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTFILES=	X11R${PORTVERSION}-src1.tar.gz \
		X11R${PORTVERSION}-src3.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Imake and other utilities from X.Org
LICENSE=	x11

PREFIX?=	${X11BASE}
USE_PERL5=	YES
MAKE_ENV=	MAKEFLAGS="CC=${CC}"
SCRIPTS_ENV=	CC=${CC}

.ifdef USE_IMAKE
.error You have `USE_IMAKE' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

.include <bsd.port.pre.mk>

DIST_SUBDIR=	xorg
WRKSRC=		${WRKDIR}/xc/config
MTREE_FILE=	/etc/mtree/BSD.x11-4.dist
MAN1=		ccmakedep.1 \
		cleanlinks.1 \
		gccmakedep.1 \
		imake.1 \
		lndir.1 \
		makedepend.1 \
		makeg.1 \
		makestrs.1 \
		mergelib.1 \
		mkdirhier.1 \
		mkhtmlindex.1 \
		pswrap.1 \
		revpath.1 \
		rman.1 \
		xmkmf.1
MANCOMPRESSED=	yes
INSTALL_TARGET=	install install.man

pre-configure:
	@${SED} -e 's|%%PTHREAD_CFLAGS%%|${PTHREAD_CFLAGS}|g ; \
		s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g' \
		${WRKSRC}/cf/FreeBSD.cf

.include <bsd.port.post.mk>
