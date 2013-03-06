# $MidnightBSD: mports/security/p5-Authen-SASL/Makefile,v 1.5 2010/03/25 01:58:55 laffer1 Exp $

PORTNAME=	Authen-SASL
PORTVERSION=	2.16
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for SASL authentication
LICENSE=	perl

BUILD_DEPENDS=	\
	p5-Digest-MD5>0:${PORTSDIR}/security/p5-Digest-MD5 \
	p5-Digest-HMAC>0:${PORTSDIR}/security/p5-Digest-HMAC

OPTIONS=	KERBEROS "Enable Kerberos support" On

PERL_CONFIGURE=	yes
CONFIGURE_ENV+=	AUTOMATED_TESTING=yes

MAN3+=	Authen::SASL.3
MAN3+=	Authen::SASL::Perl.3
MAN3+=	Authen::SASL::Perl::ANONYMOUS.3
MAN3+=	Authen::SASL::Perl::CRAM_MD5.3
MAN3+=	Authen::SASL::Perl::DIGEST_MD5.3
MAN3+=	Authen::SASL::Perl::EXTERNAL.3
MAN3+=	Authen::SASL::Perl::GSSAPI.3
MAN3+=	Authen::SASL::Perl::LOGIN.3
MAN3+=	Authen::SASL::Perl::PLAIN.3

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_KERBEROS)
BUILD_DEPENDS+=	p5-GSSAPI>0:${PORTSDIR}/security/p5-GSSAPI
.endif
RUN_DEPENDS=	${BUILD_DEPENDS}

.include <bsd.port.post.mk>
