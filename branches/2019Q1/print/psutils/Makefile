# Created by: Jean-Marc Zucconi <jmz@FreeBSD.org> and David O'Brien <obrien@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/print/psutils/Makefile 386312 2015-05-14 10:15:04Z mat $

PORTNAME=	psutils
PORTVERSION=	1.17
CATEGORIES=	print
MASTER_SITES=	ftp://ftp.dcs.ed.ac.uk/pub/ajcd/ \
		ftp://ftp.knackered.org/pub/psutils/ \
		TEX_CTAN/support/psutils
DISTNAME=	psutils-p17

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for manipulating PostScript documents

LICENSE=	other
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libpaper.so:print/libpaper

USES=		perl5
USE_PERL5=	build
WRKSRC=		${WRKDIR}/${PORTNAME}
MAKEFILE=	Makefile.unix
MAKE_ENV+=	DATADIR="${DATADIR}" PERL="${PERL}" CHMOD="${CHMOD}"
SCRIPTS_ENV+=	PERL5=${PERL} CC=${CC} DATADIR=${DATADIR} \
		MANPREFIX=${MANPREFIX} PAPER=dummy

.include <bsd.port.mk>
