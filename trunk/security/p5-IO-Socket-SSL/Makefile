# $MidnightBSD: mports/security/p5-IO-Socket-SSL/Makefile,v 1.2 2009/04/02 14:50:14 ctriv Exp $

PORTNAME=	IO-Socket-SSL
PORTVERSION=	1.24
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL sockets
LICENSE=	perl

RUN_DEPENDS=	p5-Net-SSLeay>=1.21:${PORTSDIR}/security/p5-Net-SSLeay
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		IO::Socket::SSL.3

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/example/* ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>

