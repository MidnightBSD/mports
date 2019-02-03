# $FreeBSD: ports/devel/p5-IPC-Run/Makefile,v 1.8 2006/05/11 08:34:41 tobez Exp $
# $MidnightBSD$
#

PORTNAME=	IPC-Run
PORTVERSION=	0.80
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IPC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC::Run - Run subprocesses with piping and redirection
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} >= 500800
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/IO/Tty.pm:${PORTSDIR}/devel/p5-IO-Tty
.endif

.include <bsd.port.post.mk>
