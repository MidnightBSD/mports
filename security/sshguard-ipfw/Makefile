# New ports collection makefile for:	sshguard-ipfw
# Date created:				28 April 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PKGNAMESUFFIX=	-ipfw
CONFLICTS=	sshguard-1.[0-9]* sshguard-pf-1.[0-9]* sshguard-ipfilter-1.[0-9]*

COMMENT=        Protect hosts from brute force attacks against ssh using ipfw

SSHGUARDFW=	ipfw
MASTERDIR=	${.CURDIR}/../sshguard

.include "${MASTERDIR}/Makefile"
