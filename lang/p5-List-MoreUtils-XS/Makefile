# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD: head/lang/p5-List-MoreUtils-XS/Makefile 456809 2017-12-20 14:37:42Z sunpoet $
# $MidnightBSD$

PORTNAME=	List-MoreUtils-XS
PORTVERSION=	0.428
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide compiled List::MoreUtils functions

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_PERL5=	configure
USES=		perl5

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 502401
BUILD_DEPENDS+=	p5-XSLoader>=0.22:devel/p5-XSLoader
RUN_DEPENDS+=	p5-XSLoader>=0.22:devel/p5-XSLoader
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/List/MoreUtils/XS/XS.so

.include <bsd.port.post.mk>
