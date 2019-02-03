# New ports collection makefile for:	sshguard-ipfilter
# Date created:				October 8, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$
#

PKGNAMESUFFIX=	-ipfilter
CONFLICTS=	sshguard-1.[0-9]* sshguard-ipfw-1.[0-9]* sshguard-pf-1.[0-9]*

COMMENT=        Protect hosts from brute force attacks against ssh and other services using ipfilter

SSHGUARDFW=	ipfilter
MASTERDIR=	${.CURDIR}/../sshguard

.include "${MASTERDIR}/Makefile"
