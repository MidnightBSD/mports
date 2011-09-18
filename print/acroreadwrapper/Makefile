# $MidnightBSD$
# $FreeBSD: ports/print/acroreadwrapper/Makefile,v 1.16 2011/06/27 02:52:45 hrs Exp $

PORTNAME=	acroreadwrapper
PORTVERSION=	0.0.20110529
CATEGORIES=	print
MASTER_SITES=	http://people.allbsd.org/~hrs/FreeBSD/
DISTNAME=	linux_adobe_kmod-${PORTVERSION:S,0.0.,,}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper script for Adobe Reader
LICENSE=	bsd2

RUN_DEPENDS=	${LOCALBASE}/lib/linux-libgtkembedmoz/libgtkembedmoz.so:${PORTSDIR}/www/linux-libgtkembedmoz

ONLY_FOR_ARCHS=	amd64 i386
PLIST_FILES=	bin/acroread8 bin/acroread9 bin/acroread \
		${KMODDIR}/linux_adobe.ko
PLIST_DIRS=	${KMODDIR}
SUB_FILES=	acroread 
SUB_LIST=	ACROBASE8=${ACROBASE8} \
		ACROBASE9=${ACROBASE9} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		INSTALLDIR=${INSTALLDIR} \
		LINUXBASE=${LINUXBASE} \
		LINUXSH=${LINUXBASE}/bin/sh \
		PLUGINDIR=${PLUGINDIR} \
		KMODDIR=${KMODDIR}
USE_RC_SUBR=	linux_adobe.sh
MAKE_ENV=	KMODDIR=${KMODDIR}

ADOBEBASE=	Adobe
ACROBASE8=	${ADOBEBASE}/Reader8
ACROBASE9=	${ADOBEBASE}/Reader9
PLUGINDIR=	lib/npapi/linux-acroread
KMODDIR=	libexec/linux_adobe

.include <bsd.port.pre.mk>
KERNCONF?=	GENERIC

# Use the first component of ${KERNCONF}.
.for K in ${KERNCONF}
_KERNCONF?=$K
.endfor

.if !exists(${SRC_BASE}/sys/${ARCH}/conf/${_KERNCONF})
IGNORE=		requires kernel source to be installed
.endif

post-install:
	${MKDIR} ${PREFIX}/libexec/linux_adobe
	${INSTALL_KLD} ${WRKSRC}/linux_adobe.ko \
		${PREFIX}/libexec/linux_adobe/linux_adobe.ko
	${INSTALL_SCRIPT} ${WRKDIR}/acroread ${PREFIX}/bin/acroread
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread8
	cd ${PREFIX}/bin && ${LN} -s -f acroread acroread9

.include <bsd.port.post.mk>
