# New ports collection makefile for:	SAINT
# Date created:		27 Jan 2000
# Whom:			Carl Johan Madestrand <calle.madestrand@norrgarden.se>
#
# $MidnightBSD: mports/security/saint/Makefile,v 1.1 2007/07/30 03:33:55 laffer1 Exp $
# $FreeBSD: ports/security/saint/Makefile,v 1.33 2006/10/31 02:22:03 alepulver Exp $
#

PORTNAME=	saint
PORTVERSION=	3.5.8
CATEGORIES=	security
MASTER_SITES=	ftp://147.102.222.211/pub/security/scanners/saint/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Security Administrator's Integrated Network Tool
LICENSE=	unknown

BUILD_DEPENDS=	nmap:${PORTSDIR}/security/nmap
.if defined(WITH_SAMBA)
BUILD_DEPENDS+=	smbclient:${PORTSDIR}/net/samba3
.endif

USE_PERL5=	yes
MANCOMPRESSED=	no
MAN1=		saint.1
GNU_CONFIGURE=	yes
MAKE_ENV=	"LIBS=-lrpcsvc" "XFLAGS=-g -O2   -DSTDC_HEADERS=1 -DGETGROUPS_T=gid_t -DSYS_ERRLIST_DECLARED=1 " "RPCGEN=/usr/bin/rpcgen"
INSTALL_TARGET=	all

.include <bsd.port.pre.mk>

do-install:
	@${MKDIR} ${PREFIX}/saint
	${TAR} -C ${WRKSRC} -cf - -X ${FILESDIR}/excludefiles . | ${TAR} -C ${PREFIX}/saint -xf -
.if !defined(NOPORTDOCS)
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MAN1PREFIX}/man/man1
.endif

post-install:
	@${RM} -rf ${PREFIX}/saint/include/ASM-i386

.include <bsd.port.post.mk>
