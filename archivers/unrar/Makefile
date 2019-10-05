PORTNAME=	unrar
PORTVERSION=	5.71
PORTREVISION=	0
PORTEPOCH=	5
CATEGORIES+=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/ \
		FREEBSD_LOCAL/sunpoet
DISTNAME=	unrarsrc-5.7.5

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Extract, view & test RAR archives

LICENSE=UNRAR
LICENSE_FILE=${WRKSRC}/license.txt
LICENSE_NAME=UnRAR license
LICENSE_PERMS=auto-accept dist-mirror pkg-mirror

BROKEN_SSL=   openssl-devel

OPTIONS_DEFINE=       OPENSSL_AES
OPTIONS_DEFAULT=OPENSSL_AES
OPENSSL_AES_DESC=     Use OpenSSL implementation of AES

WRKSRC=		${WRKDIR}/unrar

MAKEFILE=	makefile
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

PLIST_FILES=	bin/unrar
PORTDOCS=	license.txt readme.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unrar ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/license.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
