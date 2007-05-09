# New ports collection makefile for:	pine-pgp-filters
# Date created:				22 January 2003
# Whom:					dougb
# 
# $MidnightBSD: mports/mail/pine-pgp-filters/Makefile,v 1.2 2007/02/18 02:19:12 laffer1 Exp $
# $FreeBSD: ports/mail/pine-pgp-filters/Makefile,v 1.8 2006/06/27 17:21:19 dougb Exp $
#

PORTNAME=	pine-pgp-filters
PORTVERSION=	1.3
CATEGORIES=	mail security
MASTER_SITES=	http://dougbarton.us/Downloads/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dougb
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, fast, sh-based filters to integrate Pine with gnupg, or pgp6

RUN_DEPENDS=	pine:${PORTSDIR}/mail/pine4

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

do-build:
	cd ${WRKSRC} && ./configure --prefix=${FAKE_DESTDIR}${PREFIX}

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL} -d -o ${SHAREOWN} -g ${SHAREGRP} ${DOCSDIR}
.for file in BUGS CHANGES INSTALL LICENSE README
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
