# New ports collection makefile for:	samba-nmblookup
# Date created:				Mon Dec  5 17:00:56 JST 2005
# Whom:					Hirohisa Yamaguchi <umq@ueo.co.jp>
#
# $FreeBSD: ports/net/samba-nmblookup/Makefile,v 1.2 2006/12/07 13:55:51 mnag Exp $
# $MidnightBSD: mports/net/samba-nmblookup/Makefile,v 1.2 2007/10/25 00:33:20 laffer1 Exp $
#

PORTREVISION=		1
PORTEPOCH=		0
PKGNAMESUFFIX=		-nmblookup

COMMENT=		NetBIOS Name lookup tool

CONFLICTS=		samba-3.*

SAMBA_PORT=		samba3
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../../net/${SAMBA_PORT}
PKGDIR=			${.CURDIR}

MAN1=			nmblookup.1
MAN5=			smb.conf.5
PLIST_FILES=		bin/nmblookup

# This is taken from SAMBA_PORT
WITHOUT_ADS=		yes

do-build:
	cd ${WRKSRC} && ${MAKE} include/proto.h
	cd ${WRKSRC} && ${MAKE} bin/nmblookup

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nmblookup ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/../docs/manpages/nmblookup.1 ${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/../docs/manpages/smb.conf.5 ${MAN5PREFIX}/man/man5

.include "${MASTERDIR}/Makefile"
