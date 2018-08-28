# $FreeBSD: ports/devel/p5-Proc-WaitStat/Makefile,v 1.1 2010/03/02 05:46:31 wen Exp $
# $MidnightBSD$

PORTNAME=	Proc-WaitStat
PORTVERSION=	1.00
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interpret and act on wait() status values

LICENSE=	perl

BUILD_DEPENDS=	p5-IPC-Signal>=0:${PORTSDIR}/devel/p5-IPC-Signal
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
