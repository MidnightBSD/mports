# $MidnightBSD$
# $FreeBSD: ports/security/p5-Authen-NTLM/Makefile,v 1.8 2011/10/08 19:15:53 sunpoet Exp $

PORTNAME=	Authen-NTLM
PORTVERSION=	1.09
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:C/.*-//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An NTLM authentication module
LICENSE=	perl

BUILD_DEPENDS=	p5-Digest-HMAC>=0:${PORTSDIR}/security/p5-Digest-HMAC
RUN_DEPENDS=	p5-Digest-HMAC>=0:${PORTSDIR}/security/p5-Digest-HMAC

PERL_CONFIGURE=	yes

MAN3=		Authen::NTLM.3

.include <bsd.port.mk>
