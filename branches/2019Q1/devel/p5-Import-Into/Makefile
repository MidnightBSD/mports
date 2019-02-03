# Created by: Wen Heping <wen@FreeBSD.org>
# $FreeBSD: head/devel/p5-Import-Into/Makefile 412346 2016-04-01 14:00:51Z mat $
# $MidnightBSD$

PORTNAME=	Import-Into
PORTVERSION=	1.002005
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:HAARG
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Import packages into other packages

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Module-Runtime>=0:${PORTSDIR}/devel/p5-Module-Runtime
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
