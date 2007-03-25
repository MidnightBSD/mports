# New ports collection makefile for:	acroreadwrapper
# Date created:		20 February 2006
# Whom:			hrs
#
# $MidnightBSD: mports/print/acroreadwrapper/Makefile,v 1.1 2006/09/25 02:50:43 laffer1 Exp $
# $FreeBSD: ports/print/acroreadwrapper/Makefile,v 1.3 2006/02/22 06:58:02 hrs Exp $
#

PORTNAME=	acroreadwrapper
PORTVERSION=	0.0.20060221
PORTREVISION=   1
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper script for Adobe Reader

ONLY_FOR_ARCHS=	amd64 i386
USE_XLIB=	yes
NO_BUILD=	yes
PLIST_SUB=	ACRODIR=${ACRODIR} \
		ADOBEDIR=${ADOBEDIR}
SUB_FILES=	acroread
SUB_LIST=	ACRODIR=${ACRODIR} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		INSTALLDIR=${INSTALLDIR} \
		LINUXBASE=${LINUXBASE} \
		PLUGINDIR=${PLUGINDIR}

ADOBEDIR=	Adobe
ACRODIR=	${ADOBEDIR}/Acrobat7.0
PLUGINDIR=	lib/browser_linux_plugins

do-fetch:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/acroread ${PREFIX}/bin/acroread
	${MKDIR} ${PREFIX}/${ACRODIR}

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
