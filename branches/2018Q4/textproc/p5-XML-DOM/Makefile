# $MidnightBSD$

PORTNAME=	XML-DOM
PORTVERSION=	1.44
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for building DOM Level 1 compliant document structures
LICENSE=	perl

RUN_DEPENDS=	${PBASE}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${PBASE}/XML/Parser/PerlSAX.pm:${PORTSDIR}/textproc/p5-libxml \
		${PBASE}/LWP/UserAgent.pm:${PORTSDIR}/www/p5-libwww \
		${PBASE}/XML/RegExp.pm:${PORTSDIR}/textproc/p5-XML-RegExp
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

PBASE=		${SITE_PERL}

.include <bsd.port.mk>
