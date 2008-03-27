# New ports collection makefile for:	textproc/p5-YAML
# Date created:				01 May 2003
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/p5-YAML/Makefile,v 1.2 2007/07/22 08:11:49 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-YAML/Makefile,v 1.12 2006/11/28 10:45:22 tobez Exp $
#

PORTNAME=	YAML
PORTVERSION=	0.66
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	YAML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	YAML implementation in Perl
LICENSE=	perl

BUILD_DEPENDS=	\
	p5-Test-Base>=0.47:${PORTSDIR}/devel/p5-Test-Base
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	</dev/null

MAN1=	ysh.1
MAN3=	\
	Test::YAML.3 \
	YAML.3 \
	YAML::Base.3 \
	YAML::Dumper.3 \
	YAML::Dumper::Base.3 \
	YAML::Error.3 \
	YAML::Loader.3 \
	YAML::Loader::Base.3 \
	YAML::Marshall.3 \
	YAML::Node.3 \
	YAML::Tag.3 \
	YAML::Types.3

.include <bsd.port.mk>

