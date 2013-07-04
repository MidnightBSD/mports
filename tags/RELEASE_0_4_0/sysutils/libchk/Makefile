# New ports collection makefile for:	libchk
# Date created:		2 September 2002
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/sysutils/libchk/Makefile,v 1.2 2007/12/06 00:00:34 laffer1 Exp $
# $FreeBSD: ports/sysutils/libchk/Makefile,v 1.10 2006/05/25 20:30:08 pav Exp $
#

PORTNAME=	libchk
PORTVERSION=	1.10.3
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.iDaemons.org/pub/distfiles/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	knu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to check shared library links
LICENSE=	bsd2

USE_BZIP2=	yes
USE_RUBY=	yes
USE_RUBY_FEATURES=	optparse

FAKE_MAKEARGS+=	PREFIX=${FAKE_DESTDIR}${PREFIX} MANDIR="${FAKE_DESTDIR}${PREFIX}/man/man"

MAN1=		libchk.1
MANCOMPRESSED=	maybe
PLIST_FILES=	sbin/libchk

.include <bsd.port.mk>
