# $MidnightBSD: mports/mail/p5-MIME-Lite/Makefile,v 1.1 2008/10/11 22:12:17 laffer1 Exp $

PORTNAME=	MIME-Lite
PORTVERSION=	3.02.5
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
