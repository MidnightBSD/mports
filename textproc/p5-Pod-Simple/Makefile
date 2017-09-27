# $MidnightBSD$

PORTNAME=	Pod-Simple
PORTVERSION=	3.14
CATEGORIES=	textproc devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for parsing Pod
LICENSE=	perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
RUN_DEPENDS+=	p5-Pod-Escapes>=1.04:${PORTSDIR}/textproc/p5-Pod-Escapes
BUILD_DEPENDS+=	p5-Pod-Escapes>=1.04:${PORTSDIR}/textproc/p5-Pod-Escapes
.endif

.include <bsd.port.post.mk>
