# New ports collection makefile for:	p5-Email-MIME-ContentType
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$
#

PORTNAME=	Email-MIME-ContentType
PORTVERSION=	1.022
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse a MIME Content-Type Header

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 502508
BUILD_DEPENDS+=	p5-Encode>=2.87:converters/p5-Encode
RUN_DEPENDS+=	p5-Encode>=2.87:converters/p5-Encode
.endif

.include <bsd.port.post.mk>
