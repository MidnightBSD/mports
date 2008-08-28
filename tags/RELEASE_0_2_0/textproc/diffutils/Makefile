# New ports collection makefile for:	diffutils
# Date created:				5 September 2001
# Whom:				Garrett Rooney <rooneg@electricjellyfish.net>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/diffutils/Makefile,v 1.7 2006/05/13 04:24:43 edwin Exp $
#

PORTNAME=	diffutils
PORTVERSION=	2.8.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	diffutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU diff utilities
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

INFO=		diff
MAN1=		gcmp.1 gdiff.1 gdiff3.1 gsdiff.1
PLIST_FILES=	bin/gcmp bin/gdiff bin/gdiff3 bin/gsdiff

OPTIONS=	TIMESTAMP_PRECISION	"With nano second timestamp precision"	off

.include <bsd.port.pre.mk>

.if defined(WITH_TIMESTAMP_PRECISION)
PATCH_SITES+=	http://izb.knu.ac.kr/~bh/diffs/
PATCHFILES+=	diffutils-2.8.1-timestamp_precision.diff
PATCH_DIST_STRIP+=	-p1
.endif

.include <bsd.port.post.mk>
