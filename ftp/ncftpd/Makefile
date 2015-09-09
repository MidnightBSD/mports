# $MidnightBSD$

PORTNAME=	ncftpd
PORTVERSION=	2.8.7
PORTREVISION=	1
CATEGORIES=	ftp
MASTER_SITES=	ftp://ftp.ncftp.com/ncftpd/${PORTVERSION}/ \
		ftp://ftp.nl.uu.net/pub/unix/ftp/ncftpd/${PORTVERSION}/ \
		FREEBSD_LOCAL/beech
DISTNAME=	${PORTNAME}-${PORTVERSION}-freebsd${BINVER}-${DIST_ARCH}-export

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commercial FTP daemon with a 30-day evaluation license

LICENSE=	ncftpd
LICENSE_NAME=	NcFTP Software End-user License Agreement.
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror pkg-mirror

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	only available for amd64

NO_BUILD=	YES
RESTRICTED=	30 day evaluation license
USE_RC_SUBR=	ncftpd
SUB_FILES=	pkg-message

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4000
BINVER=		8.0
.endif
.if ${ARCH} == amd64
DIST_ARCH=	x86_64
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
