# New ports collection makefile for:	perl-ldap
# Date created:		May 30, 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	perl-ldap
PORTVERSION=	0.6500
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MARSCHAP
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/00$//}

MAINTAINER=	perl@MidnightBSD.org
COMMENT=	Client interface to LDAP servers

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Authen-SASL>=2.00:${PORTSDIR}/security/p5-Authen-SASL \
		p5-Convert-ASN1>=0.20:${PORTSDIR}/converters/p5-Convert-ASN1 \
		p5-IO-Socket-SSL>=1.26:${PORTSDIR}/security/p5-IO-Socket-SSL \
		p5-URI>=1.10:${PORTSDIR}/net/p5-URI \
		p5-XML-SAX-Base>0:${PORTSDIR}/textproc/p5-XML-SAX-Base \
		p5-XML-SAX-Writer>0:${PORTSDIR}/textproc/p5-XML-SAX-Writer
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	LWP
LWP_DESC=	LDAP support via LWP
LWP_BUILD_DEPENDS=	p5-libwww>=0:${PORTSDIR}/www/p5-libwww \
			p5-LWP-MediaTypes>=0:${PORTSDIR}/www/p5-LWP-MediaTypes \
			p5-HTTP-Negotiate>=0:${PORTSDIR}/www/p5-HTTP-Negotiate \
			p5-HTTP-Message>=0:${PORTSDIR}/www/p5-HTTP-Message \
			p5-JSON>=0:${PORTSDIR}/converters/p5-JSON
LWP_RUN_DEPENDS:=	${LWP_BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
