# New ports collection makefile for:	textproc/p5-Text-WordDiff
# Date created:				28 January 2006
# Whom:					Rod Taylor <ports@rbt.ca>
#
# $FreeBSD: ports/textproc/p5-Text-WordDiff/Makefile,v 1.5 2008/05/11 15:18:53 leeym Exp $
# $MidnightBSD$

PORTNAME=	Text-WordDiff
PORTVERSION=	0.04
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Track changes between documents
LICENSE=        perl
RUN_DEPENDS=	${SITE_PERL}/Algorithm/Diff.pm:${PORTSDIR}/devel/p5-Algorithm-Diff \
		${SITE_PERL}/Term/ANSIColor.pm:${PORTSDIR}/devel/p5-Term-ANSIColor \
		${SITE_PERL}/${PERL_ARCH}/HTML/Entities.pm:${PORTSDIR}/www/p5-HTML-Parser

PERL_MODBUILD=	yes

.include <bsd.port.mk>
