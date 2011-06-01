# $MidnightBSD: mports/mail/pine-pgp-filters/Makefile,v 1.10 2009/04/02 23:23:10 laffer1 Exp $

PORTNAME=	pine-pgp-filters
PORTVERSION=	1.8
CATEGORIES=	mail security
MASTER_SITES=	http://dougbarton.us/PGP/ppf/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dougb
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple /bin/sh-based filters to use GnuPG with Alpine
LICENSE=	bsd2

.include <bsd.port.pre.mk>

BUILD_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg
RUN_DEPENDS=	gpg2:${PORTSDIR}/security/gnupg
RUN_DEPENDS+=	alpine:${PORTSDIR}/mail/alpine

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
