# $MidnightBSD: mports/textproc/p5-Text-Autoformat/Makefile,v 1.1 2007/03/11 04:28:29 laffer1 Exp $

PORTNAME=	Text-Autoformat
PORTVERSION=	1.13
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic and manual text wrapping and reformating formatting
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Text/Reform.pm:${PORTSDIR}/textproc/p5-Text-Reform
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Text::Autoformat.3

.include <bsd.port.mk>
