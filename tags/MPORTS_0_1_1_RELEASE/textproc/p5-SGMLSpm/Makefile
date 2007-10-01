# New ports collection makefile for:	SGMLSpm
# Date created:		4 May 2004
# Whom:			Brian Candler <B.Candler@pobox.com>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-SGMLSpm/Makefile,v 1.2 2005/11/13 05:13:28 lawrance Exp $
#

PORTNAME=	SGMLSpm
PORTVERSION=	1.03
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	SGMLS
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION}ii

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for postprocessing the output from sgmls and nsgmls

USE_PERL5_RUN=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

pre-install:
	${MKDIR} ${DOCSDIR} ${EXAMPLESDIR}

INSTALL_TARGET=	install PERL5DIR=${SITE_PERL} SPECDIR=${EXAMPLESDIR}
.ifndef(NOPORTDOCS)
PORTDOCS=	*
INSTALL_TARGET+=docs install_html HTMLDIR=${DOCSDIR}
.endif

.include <bsd.port.mk>
