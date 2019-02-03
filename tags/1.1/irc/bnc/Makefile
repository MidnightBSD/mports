# New ports collection makefile for:   bnc
# Date created:        January 21, 2008
# Whom:                Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	bnc
PORTVERSION=	2.9.4
CATEGORIES=	irc
MASTER_SITES=	http://home.risingnet.net/download/ \
		http://bnc.acmeshells.com/ \
		http://www.sourcefiles.org/System/Servers/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple IRC relay proxy with support for virtual hosting
LICENSE=	gpl2

GNU_CONFIGURE=	YES
DOCS=		COPYING Changelog README example.conf

.include <bsd.port.pre.mk>

post-patch:
	${SED} -e 's,@PREFIX@,${PREFIX},g' ${WRKSRC}/bncsetup

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/bnc ${PREFIX}/bin
	@${INSTALL_SCRIPT} ${WRKSRC}/bncchk ${PREFIX}/bin
	@${INSTALL_SCRIPT} ${WRKSRC}/bncsetup ${PREFIX}/bin
	@${INSTALL_PROGRAM} ${WRKSRC}/mkpasswd ${PREFIX}/bin
	@${INSTALL_DATA} ${WRKSRC}/example.conf ${PREFIX}/etc/bnc.conf.sample
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
