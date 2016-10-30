# $MidnightBSD$
# $FreeBSD: head/textproc/p5-Pod-Readme/Makefile 412349 2016-04-01 14:25:16Z mat $

PORTNAME=	Pod-Readme
PORTVERSION=	0.11
PORTREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert POD to README file

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Regexp-Common>=0:${PORTSDIR}/textproc/p5-Regexp-Common
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5 shebangfix dos2unix
USE_PERL5=	configure
PERL_CONFIGURE=	yes
SHEBANG_FILES=	bin/pod2readme t/*

.include <bsd.port.mk>
