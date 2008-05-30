# New ports collection makefile for:	samba-libsmbclient
# Date created:				23 Juli 2003
# Whom:					Koop Mast <einekoai@chello.nl>
#
# $FreeBSD: ports/net/samba-libsmbclient/Makefile,v 1.25 2006/09/04 19:00:16 garga Exp $
# $MidnightBSD: mports/net/samba-libsmbclient/Makefile,v 1.3 2008/05/30 18:52:45 laffer1 Exp $
#

PORTREVISION=		1
PORTEPOCH=		0
PKGNAMESUFFIX=		-libsmbclient

COMMENT=		Shared libs from the samba package

CONFLICTS=

SAMBA_PORT=		samba3
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../${SAMBA_PORT}
PKGDIR=			${.CURDIR}

USE_LDCONFIG=		yes

OPTIONS=		ADS		"With Active Directory support" off \
			MSRPC		"Build the libmsrpc shared library" off \
			SHAREMODES	"Build the libsharemodes shared library" off

.include "${MASTERDIR}/Makefile"
