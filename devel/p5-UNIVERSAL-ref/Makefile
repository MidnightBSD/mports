PORTNAME=	UNIVERSAL-ref
PORTVERSION=	0.14
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JJORE
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Turns ref() into a multimethod

LICENSE=	unknown

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Utils>=0:devel/p5-B-Utils

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} >= 502501
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-ref.xs
.endif

.include <bsd.port.post.mk>
