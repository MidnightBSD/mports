# New ports collection makefile for:	sshguard-pf
# Date created:				28 April 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/sshguard-pf/Makefile,v 1.1 2008/04/29 15:46:46 laffer1 Exp $
#

PKGNAMESUFFIX=	-pf
CONFLICTS=	sshguard-1.[0-9]* sshguard-ipfw-1.[0-9]* sshguard-ipfilter-1.[0-9]*
COMMENT=	Protect hosts from brute force attacks against ssh using pf

SSHGUARDFW=	pf
MASTERDIR=	${.CURDIR}/../sshguard

.include "${MASTERDIR}/Makefile"
