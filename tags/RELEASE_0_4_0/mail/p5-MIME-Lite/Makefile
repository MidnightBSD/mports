# $MidnightBSD: mports/mail/p5-MIME-Lite/Makefile,v 1.2 2009/09/24 03:39:20 laffer1 Exp $

PORTNAME=	MIME-Lite
PORTVERSION=	3.02.8
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple interface for creating (not parsing!) MIME messages
LICENSE=	perl

BUILD_DEPENDS=	p5-Email-Date-Format>=1.000:${PORTSDIR}/mail/p5-Email-Date-Format \
		p5-MIME-Types>=1.28:${PORTSDIR}/mail/p5-MIME-Types \
		p5-Mail-Tools>=1.62:${PORTSDIR}/mail/p5-Mail-Tools
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		MIME::Lite.3 MIME::changes.3

.include <bsd.port.mk>
