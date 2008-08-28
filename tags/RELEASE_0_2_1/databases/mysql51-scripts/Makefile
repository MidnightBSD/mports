# New ports collection makefile for:    MySQL-scripts
# Date created:         28 Jan 2006
# Whom:                 Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD: ports/databases/mysql51-scripts/Makefile,v 1.8 2006/03/17 07:06:03 ale Exp $
# $MidnightBSD$

PORTNAME=	mysql
PKGNAMESUFFIX=	-scripts

COMMENT=	Multithreaded SQL database (scripts)

MASTERDIR=	${.CURDIR}/../mysql51-server

PKGINSTALL=	mustnotexist
PKGMESSAGE=	mustnotexist
PLIST=		${PKGDIR}/pkg-plist.scripts

SCRIPTS_ONLY=	yes

.include "${MASTERDIR}/Makefile"
