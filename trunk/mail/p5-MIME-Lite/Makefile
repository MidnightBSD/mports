# New ports collection makefile for:	p5-MIME-Lite
# Date created:				August 3, 1999
# Whom:	      				Alex Perel <veers@disturbed.net>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-MIME-Lite/Makefile,v 1.17 2008/01/29 16:43:38 vsevolod Exp $
#

PORTNAME=	MIME-Lite
PORTVERSION=	3.02.1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.([0-9]+)$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple interface for creating (not parsing!) MIME messages
LICENSE=	perl

RUN_DEPENDS=	p5-Mail-Tools>=1.62:${PORTSDIR}/mail/p5-Mail-Tools \
		p5-MIME-Types>=1.13:${PORTSDIR}/mail/p5-MIME-Types \
		p5-Email-Date-Format>=1:${PORTSDIR}/mail/p5-Email-Date-Format
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		MIME::Lite.3 MIME::changes.3

.include <bsd.port.pre.mk>

post-extract:
	@${PERL} -i -ne 'print unless m,^#-, .. m,;$$, or m,^if, .. m,^},' ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
