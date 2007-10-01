# New ports collection makefile for:   db-netbsd
# Date created:        1 January 2004
# Whom:                Edwin Groothuis (edwin@mavetju.org)
#
# $FreeBSD: ports/databases/db/Makefile,v 1.30 2004/02/06 13:10:59 trevor Exp $
# $MidnightBSD: mports/databases/db/Makefile,v 1.1 2006/11/05 14:29:34 laffer1 Exp $
#

PORTNAME=	db
PORTVERSION=	1.11
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	http://www.mavetju.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate db(3)'s btree(3) and hash(3) databases - NetBSD port

LICENSE=	bsd4	

MAN1=		db.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/db

MAKE_ENV=	BINDIR=${PREFIX}/bin SHAREDIR=${PREFIX}

.include <bsd.port.mk>
