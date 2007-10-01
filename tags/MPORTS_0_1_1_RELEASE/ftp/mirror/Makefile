# New ports collection makefile for:	mirror
# Date created:		15 May 1995
# Whom:			torstenb
#
# $MidnightBSD$
# $FreeBSD: ports/ftp/mirror/Makefile,v 1.22 2007/01/03 16:39:19 hrs Exp $
#

PORTNAME=	mirror
PORTVERSION=	2.9
PORTREVISION=	1
CATEGORIES=	ftp
MASTER_SITES=	ftp://sunsite.org.uk/old-sunsite/mirror/ \
		ftp://src.doc.ic.ac.uk/old-sunsite/mirror/ \
		ftp://ftp.cs.columbia.edu/archives/perl/mirror/

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	ftp.pl_wupatch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mirror packages on remote sites

PLIST_FILES=	bin/mirror \
		bin/do_unlinks \
		bin/pkgs_to_mmin \
		bin/mirror-master \
		lib/mirror/lchat.pl \
		lib/mirror/dateconv.pl \
		lib/mirror/ftp.pl \
		lib/mirror/lsparse.pl \
		lib/mirror/mirror.defaults.sample

PLIST_DIRS=	lib/mirror

USE_PERL5=	yes
NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
MAN1=		mirror.1 mirror-master.1

pre-install:
	@${MKDIR} ${PREFIX}/lib/mirror

.include <bsd.port.mk>
