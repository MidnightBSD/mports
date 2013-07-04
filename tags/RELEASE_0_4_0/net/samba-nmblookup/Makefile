# New ports collection makefile for:	samba-nmblookup
# Date created:				Mon Dec  5 17:00:56 JST 2005
# Whom:					Hirohisa Yamaguchi <umq@ueo.co.jp>
#
# $FreeBSD: ports/net/samba-nmblookup/Makefile,v 1.2 2006/12/07 13:55:51 mnag Exp $
# $MidnightBSD: mports/net/samba-nmblookup/Makefile,v 1.3 2007/11/08 15:47:33 ctriv Exp $
#

PORTREVISION=		0
PORTEPOCH=		0
PKGNAMESUFFIX=		-nmblookup

COMMENT=		NetBIOS Name lookup tool

CONFLICTS=		samba-3.*

SAMBA_PORT=		samba34
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../${SAMBA_PORT}
PKGDIR=			${.CURDIR}

MAN1=			nmblookup.1
MAN5=			smb.conf.5
PLIST_FILES=		bin/nmblookup

WITHOUT_ADS=		yes

ALL_TARGET=		libtdb bin/nmblookup

do-install:
	-@${MKDIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nmblookup ${PREFIX}/bin
	-@${MKDIR} ${MAN1PREFIX}/man/man1 ${MAN5PREFIX}/man/man5
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/manpages/nmblookup.1 ${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/manpages/smb.conf.5 ${MAN5PREFIX}/man/man5

.include "${MASTERDIR}/Makefile"
