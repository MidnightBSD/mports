# $MidnightBSD: mports/devel/oniguruma/Makefile,v 1.2 2009/10/15 01:33:18 laffer1 Exp $

PORTNAME=	oniguruma
PORTVERSION=	2.5.8
PORTREVISION=	1
CATEGORIES=	devel textproc
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/:onig \
		http://www.SpringDaemons.com/stas/:ruby
DISTFILES=	onigd${PORTVERSION:S/./_/g}${EXTRACT_SUFX}:onig \
		ruby187p72-oniguruma.patch:ruby
DIST_SUBDIR=	ruby
EXTRACT_ONLY=	onigd${PORTVERSION:S/./_/g}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A BSDL Regular Expressions library compatible with POSIX/GNU/Perl
LICENSE=	bsd2

WRKSRC=		${WRKDIR}/${PORTNAME}

NO_LATEST_LINK=	yes
CONFLICTS=	oniguruma-4.*

FAKE_OPTS=	prefixhack

GNU_CONFIGURE=	yes
DOCS=		HISTORY README doc/*

post-patch:
	${CP} ${DISTDIR}/${DIST_SUBDIR}/ruby187p72-oniguruma.patch \
		${WRKSRC}/ruby187.patch

post-configure:
	${SED} -e 's|%%PREFIX%%|${PREFIX}|' \
		${FILESDIR}/onig-config > ${WRKSRC}/onig-config

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/onig-config ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/sample/* ${EXAMPLESDIR}/
.endif

.include <bsd.port.mk>
