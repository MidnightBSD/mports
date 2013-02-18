# $MidnightBSD: mports/ftp/tnftpd/Makefile,v 1.2 2011/07/08 02:57:37 laffer1 Exp $

PORTNAME=	tnftpd
PORTVERSION=	20100324
PORTREVISION=	1
CATEGORIES=	ftp ipv6
MASTER_SITES=	ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced ftp server from NetBSD
LICENSE=	bsd4

USE_AUTOTOOLS=	aclocal automake libtool
AUTOMAKE_ARGS=	--add-missing
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4016
CFLAGS+=	-DSUPPORT_UTMPX
.else
CFLAGS+=	-DSUPPORT_UTMP
.endif

MAN5=		ftpd.conf.5 ftpusers.5
MAN8=		tnftpd.8
PLIST_FILES=	libexec/tnftpd
PORTDOCS=	ChangeLog NEWS README THANKS COPYING
PORTEXAMPLES=	ftpd.conf ftpusers

SUB_FILES=	pkg-message

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/tnftpd ${PREFIX}/libexec
	${INSTALL_MAN} ${WRKSRC}/src/ftpd.conf.man ${PREFIX}/man/man5/ftpd.conf.5
	${INSTALL_MAN} ${WRKSRC}/src/ftpusers.man ${PREFIX}/man/man5/ftpusers.5
	${INSTALL_MAN} ${WRKSRC}/src/tnftpd.man ${PREFIX}/man/man8/tnftpd.8
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
.for f in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${f} ${EXAMPLESDIR}
.endfor
.endif

.include <bsd.port.post.mk>
