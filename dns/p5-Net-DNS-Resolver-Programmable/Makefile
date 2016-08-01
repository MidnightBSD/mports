# $MidnightBSD$
# $FreeBSD: ports/dns/p5-Net-DNS-Resolver-Programmable/Makefile,v 1.1 2007/02/10 16:13:31 miwi Exp $

PORTNAME=	Net-DNS-Resolver-Programmable
PORTVERSION=	0.003
CATEGORIES=	dns net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable DNS resolver for off-line testing

LICENSE=	gpl2

RUN_DEPENDS=	p5-Net-DNS>=1.05:${PORTSDIR}/dns/p5-Net-DNS
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
PERL_MODBUILD=	yes
PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

DOCSDIR=	${PREFIX}/share/doc/p5-Net-DNS-Resolver-Programmable

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in CHANGES README TODO
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
