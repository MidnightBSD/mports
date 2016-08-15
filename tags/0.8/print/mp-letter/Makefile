# $MidnightBSD$
# $FreeBSD: ports/print/mp-letter/Makefile,v 1.25 2008/03/30 23:09:34 obrien Exp $

PORTNAME=	mp-${PAPERSIZE}
PORTVERSION=	3.0.1
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	FREEBSD_LOCAL/obrien
DISTNAME=	mp-3.0.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostScript printing util for ASCII files, email, USENET news articles, etc

LICENSE=	other

WRKSRC=		${WRKDIR}/mp
LINKS=		digestp filep filofaxp franklinp mailp newsp timemanp timesysp

PAPERSIZE?=	letter
.if ${PAPERSIZE:tl} == a4
INSTALL_TARGET=	install-a4
.endif

MAKEFILE=	Makefile.dist

post-install:
.for a in ${LINKS}
	${LN} -sf mp.1 ${PREFIX}/man/man1/${a}.1
.endfor

.include <bsd.port.mk>
