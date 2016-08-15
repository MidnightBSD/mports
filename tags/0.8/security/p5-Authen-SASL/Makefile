# $MidnightBSD$

PORTNAME=	Authen-SASL
PORTVERSION=	2.16
PORTREVISION=	1
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for SASL authentication

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	\
	p5-Digest-MD5>0:${PORTSDIR}/security/p5-Digest-MD5 \
	p5-Digest-HMAC>0:${PORTSDIR}/security/p5-Digest-HMAC

OPTIONS=	KERBEROS "Enable Kerberos support" On

PERL_CONFIGURE=	yes
CONFIGURE_ENV+=	AUTOMATED_TESTING=yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_KERBEROS)
BUILD_DEPENDS+=	p5-GSSAPI>0:${PORTSDIR}/security/p5-GSSAPI
.endif
RUN_DEPENDS=	${BUILD_DEPENDS}

.include <bsd.port.post.mk>
