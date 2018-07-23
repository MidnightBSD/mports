# Created by: Dominik Brettnacher <domi@saargate.de>
# $FreeBSD: head/dns/p5-Net-LibIDN/Makefile 450679 2017-09-26 15:56:12Z sunpoet $
# $MidnightBSD$

PORTNAME=	Net-LibIDN
PORTVERSION=	0.12
PORTREVISION=	4
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This module provides access to the libidn library

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE_ART10=	${WRKSRC}/Artistic

LIB_DEPENDS=	libidn.so:dns/libidn

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libidn=${LOCALBASE}/lib \
		--with-libidn-inc=${LOCALBASE}/include

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Net/LibIDN/LibIDN.so

.include <bsd.port.mk>
