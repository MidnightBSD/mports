# $MidnightBSD: mports/print/acroreadwrapper/Makefile,v 1.6 2010/04/28 20:37:31 vganji Exp $
#

PORTNAME=	acroreadwrapper
PORTVERSION=	0.0.20090328
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper script for Adobe Reader
LICENSE=	bsd2

ONLY_FOR_ARCHS=	amd64 i386
NO_BUILD=	yes
PLIST_FILES=	bin/acroread7 bin/acroread8 bin/acroread9 bin/acroread
SUB_FILES=	acroread
SUB_LIST=	ACROBASE7=${ACROBASE7} \
		ACROBASE8=${ACROBASE8} \
		ACROBASE9=${ACROBASE9} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		INSTALLDIR=${INSTALLDIR} \
		LINUXBASE=${LINUXBASE} \
		LINUXSH=${LINUXBASE}/bin/sh \
		PLUGINDIR=${PLUGINDIR} \

ADOBEBASE=	Adobe
ACROBASE7=	${ADOBEBASE}/Acrobat7.0
ACROBASE8=	${ADOBEBASE}/Reader8
ACROBASE9=	${ADOBEBASE}/Reader9
PLUGINDIR=	lib/npapi/linux-acroread

do-fetch:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/acroread ${PREFIX}/bin/acroread
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread7
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread8
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread9

.include <bsd.port.mk>
