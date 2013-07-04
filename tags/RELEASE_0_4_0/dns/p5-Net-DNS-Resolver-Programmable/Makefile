# New ports collection makefile for:	p5-Net-DNS-Resolver-Programmable
# Date created:				February 9, 2007
# Whom:	      				Koen Martens <gmc@sonologic.nl>
#
# $MidnightBSD: mports/dns/p5-Net-DNS-Resolver-Programmable/Makefile,v 1.4 2008/06/07 16:44:40 laffer1 Exp $
# $FreeBSD: ports/dns/p5-Net-DNS-Resolver-Programmable/Makefile,v 1.1 2007/02/10 16:13:31 miwi Exp $
#

PORTNAME=	Net-DNS-Resolver-Programmable
PORTVERSION=	0.003
CATEGORIES=	dns net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable DNS resolver for off-line testing
LICENSE=	gpl2

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes
PERL_CONFIGURE=	yes

MAN3=		Net::DNS::Resolver::Programmable.3

.include <bsd.port.pre.mk>

DOCSDIR=	${PREFIX}/share/doc/p5-Net-DNS-Resolver-Programmable

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in CHANGES README TODO
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.if ${PERL_LEVEL} < 501000
BUILD_DEPENDS+=  ${SITE_PERL}/${PERL_ARCH}/version.pm:${PORTSDIR}/devel/p5-version
RUN_DEPENDS+=    ${SITE_PERL}/${PERL_ARCH}/version.pm:${PORTSDIR}/devel/p5-version
.endif

.include <bsd.port.post.mk>
