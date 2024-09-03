PORTNAME=	tnftpd
DISTVERSION=	20231001
PORTREVISION=	1
CATEGORIES=	ftp
MASTER_SITES=	https://cdn.netbsd.org/pub/NetBSD/misc/tnftp/ \
		https://ftp.uni-erlangen.de/netbsd/misc/tnftp/ \
		https://ftp.jaist.ac.jp/pub/NetBSD/misc/tnftp/ \
		https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced FTP server from NetBSD
WWW=		https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/

LICENSE=	bsd2 bsd3
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf libtool
GNU_CONFIGURE=	yes
AUTOMAKE_ARGS=	--add-missing
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal

.include <bsd.port.pre.mk>

CFLAGS+=	-DSUPPORT_UTMPX -fcommon

SUB_FILES=	pkg-message

PLIST_FILES=	libexec/tnftpd \
		share/man/man5/ftpd.conf.5.gz \
		share/man/man5/ftpusers.5.gz \
		share/man/man8/tnftpd.8.gz
PORTDOCS=	COPYING ChangeLog NEWS README THANKS
PORTEXAMPLES=	ftpd.conf ftpusers

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/tnftpd ${PREFIX}/libexec
	${INSTALL_MAN} ${WRKSRC}/src/ftpd.conf.man ${PREFIX}/share/man/man5/ftpd.conf.5
	${INSTALL_MAN} ${WRKSRC}/src/ftpusers.man ${PREFIX}/share/man/man5/ftpusers.5
	${INSTALL_MAN} ${WRKSRC}/src/tnftpd.man ${PREFIX}/share/man/man8/tnftpd.8

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for f in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${f} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.post.mk>
