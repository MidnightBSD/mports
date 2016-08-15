# Created by: snowchyld
# $FreeBSD: head/textproc/p5-Hash-Merge/Makefile 386097 2015-05-11 18:34:57Z mat $
# $MidnightBSD$

PORTNAME=	Hash-Merge
PORTVERSION=	0.20
DISTVERSIONSUFFIX=	0
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Merges hashes

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Clone>=0:${PORTSDIR}/devel/p5-Clone
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
