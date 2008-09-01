# New ports collection makefile for:	l0phtcrack
# Date created:				2000-10-31
# Whom:					Trevor Johnson
#
# $MidnightBSD: mports/security/l0phtcrack/Makefile,v 1.1 2007/07/29 21:41:40 laffer1 Exp $
# $FreeBSD: ports/security/l0phtcrack/Makefile,v 1.17 2006/09/03 17:34:52 kris Exp $
#

PORTNAME=	l0phtcrack
PORTVERSION=	1.5
CATEGORIES=	security
MASTER_SITES=	http://www.mavetju.org/download/adopted/ \
		http://www.cotse.com/sw/WinNT/
DISTNAME=	lcsrc
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cracks SAMBA or Windows NT passwords
LICENSE=	restricted

DOCDIR=		share/doc/${PORTNAME}
RESTRICTED=	"uses GNU getopt with BSDish-licensed code from OpenSSL"
NO_WRKSUBDIR=	yes
PLIST=		${WRKDIR}/pkg-plist
USE_PERL5_BUILD=yes
USE_ZIP=	yes

post-extract:
	${RM} ${WRKDIR}/*exe
	${PERL} -pi -e "s:\r::g" ${WRKDIR}/*
	${PERL} -pi -e "s:ommited:omitted:g" ${WRKDIR}/util.c

do-build:
	cd ${WRKDIR} && ${CC} ${CFLAGS} -DMPU8086 *.c -o lc_CLI

pre-install:
	${ECHO_CMD} bin/lc_CLI > ${PLIST}
.if !defined(NOPORTDOCS)
	for i in `${FIND} ${WRKDIR} -name '*txt'`; \
		do ${ECHO_CMD} ${DOCDIR}/`${BASENAME} $${i}` >> ${PLIST}; \
	done
	${ECHO_CMD} @dirrm ${DOCDIR} >> ${PLIST}
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lc_CLI ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/${DOCDIR}
	cd ${WRKSRC} && ${PAX} -r -w *txt ${PREFIX}/${DOCDIR}
.endif

.include <bsd.port.mk>
