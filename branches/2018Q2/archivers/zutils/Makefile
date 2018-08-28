# Created by: Albert Vernon <f3cun3c02@sneakemail.com>
# $FreeBSD: head/archivers/zutils/Makefile 389858 2015-06-16 19:10:00Z danilo $
# $MidnightBSD$

PORTNAME=	zutils
PORTVERSION=	1.4
CATEGORIES=	archivers
MASTER_SITES=	SAVANNAH/zutils
EXTRACT_SUFX=	.tar.lz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for searching in bzip2, gzip, lzip, and xz archives

LICENSE=	gpl2

EXTRACT_DEPENDS=	lzip:${PORTSDIR}/archivers/lzip

INFO=		zutils

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

do-extract:
	@${MKDIR} ${WRKDIR}
	@(cd ${WRKDIR} ; ${LOCALBASE}/bin/lzip -cd \
		${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} | ${TAR} -xf -)

post-patch:
	# Remove compiler hardcoded flags and use environment
	@${REINPLACE_CMD} '23,26d' ${WRKSRC}/configure

post-install:
	@-${RM} ${PREFIX}/info/dir

.include <bsd.port.mk>
