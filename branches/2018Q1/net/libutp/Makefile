# $MidnightBSD$

PORTNAME=	bittorrent-libutp
PORTVERSION=	0.20130514
CATEGORIES=	net devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The uTorrent Transport Protocol library and sample utilities

LICENSE=	mit

USE_GITHUB=	yes
GH_ACCOUNT=	${PORTNAME:C/-.*//}
GH_PROJECT=	${PORTNAME:C/.*-//}
GH_TAGNAME=	7c4f19a

WRKSRC=		${WRKDIR}/libutp-7c4f19a

USE_DOS2UNIX=	yes
#USES=		dos2unix uidfix
MAKEFILE=	${FILESDIR}/BSDmakefile
USE_LDCONFIG=	yes

FAKE_OPTS=	trueprefix

pre-patch: dos2unix

pre-install:
	@${MKDIR} ${PREFIX}/include/libutp

post-build:
	${MAKE} -f ${FILESDIR}/BSDmakefile.utils -C ${WRKSRC}/utp_file PROG_CXX=utp_send
	${MAKE} -f ${FILESDIR}/BSDmakefile.utils -C ${WRKSRC}/utp_file PROG_CXX=utp_recv
	${MAKE} -f ${FILESDIR}/BSDmakefile.utils -C ${WRKSRC}/utp_test PROG_CXX=utp_test

post-install:
	${INSTALL_PROGRAM}	\
	    ${WRKSRC}/utp_file/utp_send	\
	    ${WRKSRC}/utp_file/utp_recv	\
	    ${WRKSRC}/utp_test/utp_test \
		${PREFIX}/bin/

.include <bsd.port.mk>
