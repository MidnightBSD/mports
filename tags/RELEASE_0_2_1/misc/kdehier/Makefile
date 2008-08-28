# New ports collection makefile for:	kdehier
# Date created:				4 May 2003
# Whom:					Frerich Raabe <frerich.raabe@gmx.de>
#
# $FreeBSD: ports/misc/kdehier/Makefile,v 1.20 2006/09/12 23:26:33 lofi Exp $
# $MidnightBSD: mports/misc/kdehier/Makefile,v 1.2 2007/12/29 22:04:42 laffer1 Exp $
#

PORTNAME=	kdehier
PORTVERSION=	1.0
PORTREVISION=	11
CATEGORIES=	misc kde
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility port which installs a hierarchy of shared KDE directories
LICENSE=	unknown

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-fetch:
	@${DO_NADA}

do-install:
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/dirlist`; \
	do \
		${MKDIR} ${PREFIX}/$${dir}; \
		${TOUCH} ${PREFIX}/$${dir}/.keep_me; \
	done

.include <bsd.port.mk>
