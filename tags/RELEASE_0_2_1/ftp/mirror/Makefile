# New ports collection makefile for:	mirror
# Date created:		15 May 1995
# Whom:			torstenb
#
# $MidnightBSD: mports/ftp/mirror/Makefile,v 1.2 2008/04/12 00:32:39 laffer1 Exp $
# $FreeBSD: ports/ftp/mirror/Makefile,v 1.22 2007/01/03 16:39:19 hrs Exp $
#

PORTNAME=	mirror
PORTVERSION=	2.9
PORTREVISION=	1
CATEGORIES=	ftp
MASTER_SITES=	http://ry.ca/mirror/mirror/ \
		ftp://sunsite.ualberta.ca/pub/Mirror/mirror/

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	ftp.pl_wupatch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mirror packages on remote sites
LICENSE=	other

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
