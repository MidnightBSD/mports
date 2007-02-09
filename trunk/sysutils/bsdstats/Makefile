# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD$ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.3
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine

.include <bsd.port.pre.mk>

NO_BUILD=	yes
PLIST_FILES=	etc/periodic/monthly/300.statistics
PLIST_DIRS=	etc/periodic/monthly \
		etc/periodic

do-install:
	${MKDIR} ${LOCALBASE}/etc/periodic/monthly
	${CP} ${FILESDIR}/300.statistics ${LOCALBASE}/etc/periodic/monthly
post-install:
	${CAT} ${PKGMESSAGE}
.if defined(BATCH) || defined(PACKAGE_BUILDING)
	@${ECHO_MSG} "	To activate monthly statistics reporting in /etc/periodic.conf,"
	@${ECHO_MSG} "	execute the following as root user:"
	@${ECHO_MSG}
	@${ECHO_MSG} "PKG_PREFIX=\"${PREFIX}\" ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL"
	@${ECHO_MSG}
.else
	@PKG_PREFIX="${PREFIX}" ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.post.mk>
