# New ports collection makefile for:    ztelnet
# Date created:         15 Mar 1998
# Whom:                 CHOI Junho <junker@jazz.snu.ac.kr>
#
# $MidnightBSD$
# $FreeBSD: ports/net/ztelnet/Makefile,v 1.22 2007/10/01 06:16:12 linimon Exp $
#

PORTNAME=	ztelnet
PORTVERSION=	1.0.p3
CATEGORIES=	net
MASTER_SITES=	http://www.exit.com/Archives/FreeBSD/
DISTFILES=	ztelnet-linux.tar.gz ztelnet-patch.tar.gz \
		ztelnet-patch-cmascott.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Telnet program with zmodem transfer
LICENSE=	restricted

RESTRICTED=	"zmodem code has restrictive copyright"

NO_WRKSUBDIR=	yes
PATCH_STRIP=	-p1
MAN1=		ztelnet.1
PLIST_FILES=	bin/ztelnet

.include <bsd.port.pre.mk>

post-patch:
	# we can ignore warnings
	@( cd ${WRKSRC}/ztelnet && \
	${PATCH} -s -p1 < ${WRKSRC}/ztelnet.patch || \
	${TRUE} ) > /dev/null 2>&1
	# but it is not
	@cd ${WRKSRC}/ztelnet && \
	${PATCH} -s -p1 < ${WRKSRC}/rz.patch && \
	${PATCH} -s -p1 < ${WRKSRC}/sz.patch

do-build:
	@cd ${WRKSRC}/ztelnet && \
	${MAKE} clean && \
	${MAKE} 4.4bsd

do-install:
	@cd ${WRKSRC}/ztelnet; \
	${MKDIR} ${PREFIX}/bin; \
	${INSTALL_PROGRAM} telnet/telnet ${PREFIX}/bin/ztelnet
	${INSTALL_MAN} ${WRKSRC}/ztelnet.1 ${PREFIX}/man/man1/ztelnet.1

.include <bsd.port.post.mk>
