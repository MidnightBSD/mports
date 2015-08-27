# Created by: Peter Pentchev <roam@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/security/apg/Makefile 386507 2015-05-16 09:30:34Z matthew $

PORTNAME=	apg
PORTVERSION=	2.3.0b
CATEGORIES=	security
MASTER_SITES=	http://www.adel.nursat.kz/apg/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automated password generator

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

DOCS=		APG_TIPS pronun.txt rfc0972.txt rfc1750.txt

OPTIONS_DEFINE=	CRACKLIB DOCS
CRACKLIB_DESC=	CrackLib support for password quality
CRACKLIB_LIB_DEPENDS=	libcrack.so:${PORTSDIR}/security/cracklib
CRACKLIB_MAKE_ARGS=	-DWITH_CRACKLIB

post-extract:
	@${FIND} ${WRKSRC} -type d | ${XARGS} ${CHMOD} u+wx
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${CHMOD} u+w

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/apg ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/apgbfm ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/apgd ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/doc/man/apg.1 ${STAGEDIR}${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/man/apgbfm.1 ${STAGEDIR}${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/man/apgd.8 ${STAGEDIR}${MANPREFIX}/man/man8
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/doc/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
