# $MidnightBSD: mports/security/p5-Net-SSLeay/Makefile,v 1.1 2006/10/31 23:28:44 wintellect Exp $

PORTNAME=	Net-SSLeay
PORTVERSION=	1.35
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL
LICENSE=	perl

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	"${OPENSSLBASE}"
USE_OPENSSL=	yes

MAN3=		Net::SSLeay.3 Net::SSLeay::Handle.3

SRCDIR=		${WRKSRC}/examples

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${SRCDIR}/*.pl ${EXAMPLESDIR}/
	${INSTALL_DATA} ${SRCDIR}/req.conf ${EXAMPLESDIR}/req.conf
.endif

.include <bsd.port.pre.mk>

.include <bsd.port.post.mk>
