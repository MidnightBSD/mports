# $MidnightBSD$
# $FreeBSD: ports/devel/oniguruma4/Makefile,v 1.37 2007/02/11 21:02:15 dinoex Exp $

PORTNAME=	oniguruma
PORTVERSION=	4.7.1
CATEGORIES=	devel textproc
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
DISTNAME=	onig-${PORTVERSION}
DIST_SUBDIR=	ruby
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BSDL Regular Expressions library compatible with POSIX/GNU/Perl

LICENSE=	bsd2

CONFLICTS=	oniguruma-2.*
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
DOCS=		HISTORY README doc/*

post-patch:
	${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		${WRKSRC}/configure

post-configure:
	${SED} -e 's|%%PREFIX%%|${PREFIX}|' \
		${FILESDIR}/onig-config > ${WRKSRC}/onig-config

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/onig-config ${PREFIX}/bin/
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/sample/*.c ${WRKSRC}/sample/Makefile* \
		${EXAMPLESDIR}/
	${MKDIR} ${DOCSDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor

.include <bsd.port.mk>
