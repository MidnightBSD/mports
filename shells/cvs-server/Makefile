# $MidnightBSD$

PORTNAME=	cvs-server
PORTVERSION=	20120307
CATEGORIES=	shells devel
MASTER_SITES=	# no dist 
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	cvs-server only shell
LICENSE=	publicdom

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${CP} ${FILESDIR}/cvs_server.c ${WRKSRC}
	@cd ${WRKSRC} && gcc cvs_server.c -o cvs_server
	@${INSTALL_PROGRAM} ${WRKSRC}/cvs_server ${PREFIX}/bin/cvs_server

.include <bsd.port.mk>
