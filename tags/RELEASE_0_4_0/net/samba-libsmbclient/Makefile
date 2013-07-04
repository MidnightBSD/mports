# New ports collection makefile for:	samba-libsmbclient
# Date created:				23 Juli 2003
# Whom:					Koop Mast <einekoai@chello.nl>
#
# $FreeBSD: ports/net/samba-libsmbclient/Makefile,v 1.25 2006/09/04 19:00:16 garga Exp $
# $MidnightBSD: mports/net/samba-libsmbclient/Makefile,v 1.5 2011/08/07 18:52:15 laffer1 Exp $
#

PORTREVISION=		0
PORTEPOCH=		0
PKGNAMESUFFIX=		-libsmbclient

COMMENT=		Shared libs from the samba package

CONFLICTS=

SAMBA_PORT=		samba34
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../${SAMBA_PORT}
PKGDIR=			${.CURDIR}

USE_LDCONFIG=		yes
CONFIGURE_ARGS+=        --without-libtdb

OPTIONS=		ADS		"With Active Directory support" off \
			ADDNS		"Build the libaddns shared library" off \
			NETAPI		"Build the libnetapi shared library" off \
			SHAREMODES	"Build the libsharemodes shared library" off

.include "${MASTERDIR}/Makefile"
