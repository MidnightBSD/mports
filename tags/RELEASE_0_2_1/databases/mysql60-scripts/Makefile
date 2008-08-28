# New ports collection makefile for:    MySQL-scripts
# Date created:         28 Jan 2006
# Whom:                 Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/mysql60-scripts/Makefile,v 1.13 2008/07/26 08:33:38 ale Exp $
#

PORTNAME=	mysql
PKGNAMESUFFIX=	-scripts

COMMENT=	Multithreaded SQL database (scripts)

MASTERDIR=	${.CURDIR}/../mysql60-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.scripts

SCRIPTS_ONLY=	yes

.include "${MASTERDIR}/Makefile"
