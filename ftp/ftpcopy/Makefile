PORTNAME=	ftpcopy
PORTVERSION=	0.6.7
CATEGORIES=	ftp
MASTER_SITES=	http://www.ohse.de/uwe/ftpcopy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line FTP tools for listing and mirroring
WWW=		https://www.ohse.de/uwe/ftpcopy.html

LICENSE=	gpl2

USES=		perl5
USE_PERL5=	build

OPTIONS_DEFINE=	DOCS

MANPAGES=	ftpcopy.1 ftpcp.1 ftpls.1

WRKSRC=		${WRKDIR}/web/${DISTNAME}

pre-build:
	${ECHO} "${CC}" >${WRKSRC}/src/conf-cc
	${ECHO} "${CPPFLAGS} ${CFLAGS}" >${WRKSRC}/src/conf-cflags
	${ECHO} "${LDFLAGS}" >${WRKSRC}/src/conf-ldflags

do-install:
	cd ${WRKSRC}/compile && \
		${INSTALL_PROGRAM} ftpcopy ftpls ${PREFIX}/bin && \
		${INSTALL_MAN} ${MANPAGES} ${PREFIX}/share/man/man1 && \
		${INSTALL_SCRIPT} ftpcp ${PREFIX}/bin
	${MKDIR} ${DOCSDIR} && \
	cd ${WRKSRC}/compile && \
		${INSTALL_DATA} ChangeLog NEWS \
			README THANKS ftpcopy.html ftpls.html ${DOCSDIR}

.include <bsd.port.mk>
