# $MidnightBSD$
# $FreeBSD: ports/devel/p5-File-HomeDir/Makefile,v 1.11 2007/01/10 06:27:25 leeym Exp $

PORTNAME=	File-HomeDir
PORTVERSION=	1.002
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get home directory for self or other users

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-File-Which>=0:${PORTSDIR}/sysutils/p5-File-Which
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
