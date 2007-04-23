# New ports collection Makefile for:	ncftpd
# Date created:		19 June 2001
# Whom:			Justin Stanford <jus@security.za.net>
#
# $MidnightBSD: mports/ftp/ncftpd/Makefile,v 1.1 2007/04/02 00:52:57 laffer1 Exp $
# $FreeBSD: ports/ftp/ncftpd/Makefile,v 1.17 2006/11/12 11:57:27 itetcu Exp $
#

PORTNAME=	ncftpd
PORTVERSION=	2.8.3
CATEGORIES=	ftp
MASTER_SITES=	${MASTER_SITE_LOCAL} \
		ftp://ftp.ncftp.com/ncftpd/${PORTVERSION}/ \
		ftp://ftp.nl.uu.net/pub/unix/ftp/ncftpd/${PORTVERSION}/
MASTER_SITE_SUBDIR=	miwi
DISTNAME=	${PORTNAME}-${PORTVERSION}-freebsd${BINVER}-${ARCH}-export

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A well known commercial FTP daemon with a 30-day evaluation license

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
PKGMESSAGE=	${WRKDIR}/pkg-message

ONLY_FOR_ARCHS=	i386
NO_BUILD=	YES
LICENSE=	shareware
RESTRICTED=	30 day evaluation license

.include <bsd.port.pre.mk>

BINVER=		6.0

do-install:
	${MKDIR} ${PREFIX}/etc/ncftpd
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_edquota ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_passwd ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_repquota ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ncftpd_spy ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/conf/general.cf-dist ${PREFIX}/etc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/conf/domain.cf-dist ${PREFIX}/etc/ncftpd
	${INSTALL_SCRIPT} ${SCRIPTDIR}/ncftpd.sh ${PREFIX}/etc/rc.d

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/install.html ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/README.freebsd ${PREFIX}/share/doc/ncftpd
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${PREFIX}/share/doc/ncftpd
.endif
	@${SED} -e 's,%%PREFIX%%,${TRUE_PREFIX},' pkg-message > ${PKGMESSAGE}

.include <bsd.port.post.mk>
