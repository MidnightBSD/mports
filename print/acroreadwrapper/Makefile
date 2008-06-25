# New ports collection makefile for:	acroreadwrapper
# Date created:		20 February 2006
# Whom:			hrs
#
# $MidnightBSD: mports/print/acroreadwrapper/Makefile,v 1.4 2008/03/04 19:22:06 laffer1 Exp $
# $FreeBSD: ports/print/acroreadwrapper/Makefile,v 1.9 2008/01/04 20:20:20 hrs Exp $
#

PORTNAME=	acroreadwrapper
PORTVERSION=	0.0.20080110
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper script for Adobe Reader
LICENSE=	bsd2

ONLY_FOR_ARCHS=	amd64 i386
NO_BUILD=	yes
PLIST_FILES=	bin/acroread7 bin/acroread8 bin/acroread
SUB_FILES=	acroread
SUB_LIST=	ACROBASE7=${ACROBASE7} \
		ACROBASE8=${ACROBASE8} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		INSTALLDIR=${INSTALLDIR} \
		LINUXBASE=${LINUXBASE} \
		LINUXSH=${LINUXBASE}/bin/sh \
		PLUGINDIR=${PLUGINDIR} \

ADOBEBASE=	Adobe
ACROBASE7=	${ADOBEBASE}/Acrobat7.0
ACROBASE8=	${ADOBEBASE}/Reader8
PLUGINDIR=	lib/npapi/linux-acroread

do-fetch:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/acroread ${PREFIX}/bin/acroread
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread8
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread7

.include <bsd.port.mk>
