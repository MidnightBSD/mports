# $MidnightBSD: mports/security/p5-Net-SSLeay/Makefile,v 1.3 2012/02/03 03:56:06 laffer1 Exp $

PORTNAME=	Net-SSLeay
PORTVERSION=	1.52
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL
LICENSE=	perl

PERL_CONFIGURE=	yes
CONFIGURE_ENV=	OPENSSL_PREFIX=${OPENSSLBASE}
USE_OPENSSL=	yes

MAN3=		Net::SSLeay.3 Net::SSLeay::Handle.3

.if !defined(NOPORTEXAMPLES)
PORTEXAMPLES=	*

post-install:
	${MKDIR} ${EXAMPLESDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/req.conf ${EXAMPLESDIR}/req.conf
.endif

.include <bsd.port.mk>
