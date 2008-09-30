# New ports collection Makefile for:	ncftpd
# Date created:		19 June 2001
# Whom:			Justin Stanford <jus@security.za.net>
#
# $MidnightBSD: mports/ftp/ncftpd/Makefile,v 1.2 2007/04/23 02:49:57 ctriv Exp $
# $FreeBSD: ports/ftp/ncftpd/Makefile,v 1.17 2006/11/12 11:57:27 itetcu Exp $
#

PORTNAME=	ncftpd
PORTVERSION=	2.8.5
CATEGORIES=	ftp
MASTER_SITES=	ftp://ftp.ncftp.com/ncftpd/${PORTVERSION}/ \
		ftp://ftp.nl.uu.net/pub/unix/ftp/ncftpd/${PORTVERSION}/ \
		LOCAL/beech
DISTNAME=	${PORTNAME}-${PORTVERSION}-freebsd${BINVER}-${DIST_ARCH}-export

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A well known commercial FTP daemon with a 30-day evaluation license
LICENSE=	restricted

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	YES
RESTRICTED=	30 day evaluation license
USE_RC_SUBR=	ncftpd.sh
SUB_FILES=	pkg-message

.include <bsd.port.pre.mk>

BINVER=		6.0
.if ${ARCH} == amd64
DIST_ARCH=	x86_64
.if ${BINVER} == "6.0"
BINVER=		6.2
.endif
.else
DIST_ARCH=	i386
.endif

do-install:
	${MKDIR} ${PREFIX}/etc/ncftpd
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_edquota ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_passwd ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_repquota ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_spy ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/conf/general.cf-dist ${PREFIX}/etc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/conf/domain.cf-dist ${PREFIX}/etc/ncftpd

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/install.html ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/README.freebsd ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${PREFIX}/share/doc/ncftpd
.endif

.include <bsd.port.post.mk>
