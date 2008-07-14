# New ports collection makefile for:	pine-pgp-filters
# Date created:				22 January 2003
# Whom:					dougb
#
# $MidnightBSD: mports/mail/pine-pgp-filters/Makefile,v 1.8 2008/06/18 22:09:46 laffer1 Exp $
# $FreeBSD: ports/mail/pine-pgp-filters/Makefile,v 1.13 2007/12/26 22:18:26 dougb Exp $
#

PORTNAME=	pine-pgp-filters
PORTVERSION=	1.6
PORTREVISION=	4
CATEGORIES=	mail security
MASTER_SITES=	http://dougbarton.us/PGP/scripts/ppf/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dougb
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple /bin/sh-based filters to use GnuPG with Pine or Alpine
LICENSE=	bsd2

.include <bsd.port.pre.mk>

BUILD_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg
RUN_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg

.if exists(${LOCALBASE}/bin/pine)
RUN_DEPENDS+=	pine:${PORTSDIR}/mail/pine4
.else
RUN_DEPENDS+=	alpine:${PORTSDIR}/mail/alpine
.endif

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

do-configure:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/libexec
	@(cd ${WRKSRC} && ./configure )

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL} -d -o ${SHAREOWN} -g ${SHAREGRP} ${DOCSDIR}
.for file in BUGS CHANGES INSTALL LICENSE README
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
