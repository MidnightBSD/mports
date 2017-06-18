# $FreeBSD: ports/net/samba-nmblookup/Makefile,v 1.2 2006/12/07 13:55:51 mnag Exp $
# $MidnightBSD$

PORTREVISION=		0
PORTEPOCH=		0
PKGNAMESUFFIX=		-nmblookup

COMMENT=		NetBIOS Name lookup tool

CONFLICTS=		samba-[2-4].*

SAMBA_PORT=		samba43
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../${SAMBA_PORT}
PKGDIR=			${.CURDIR}

PLIST_FILES=		bin/nmblookup \
			man/man1/nmblookup.1.gz \
			man/man5/smb.conf.5.gz

WITHOUT_ADS=		yes

ALL_TARGET=		bin/nmblookup

do-install:
	-@${MKDIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nmblookup ${PREFIX}/bin
	-@${MKDIR} ${MAN1PREFIX}/man/man1 ${MAN5PREFIX}/man/man5
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/manpages/nmblookup.1 ${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/manpages/smb.conf.5 ${MAN5PREFIX}/man/man5

.include "${MASTERDIR}/Makefile"
