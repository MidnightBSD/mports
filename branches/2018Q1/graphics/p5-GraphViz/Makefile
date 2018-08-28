# $MidnightBSD$

PORTNAME=	GraphViz
PORTVERSION=	2.04
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GraphViz - Perl interface to the GraphViz graphing tool
LICENSE=	perl

BUILD_DEPENDS=	dot:${PORTSDIR}/graphics/graphviz
RUN_DEPENDS=	p5-IPC-Run>=0:${PORTSDIR}/devel/p5-IPC-Run \
		p5-Parse-RecDescent>=0:${PORTSDIR}/devel/p5-Parse-RecDescent \
		p5-XML-Twig>=0:${PORTSDIR}/textproc/p5-XML-Twig \
		dot:${PORTSDIR}/graphics/graphviz

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
