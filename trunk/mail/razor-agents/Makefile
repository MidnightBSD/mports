# $MidnightBSD$

PORTNAME=	razor-agents
PORTVERSION=	2.85
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	SF/razor/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A distributed, collaborative, spam detection and filtering network

LICENSE=	artistic2

BUILD_DEPENDS=	p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-Digest-SHA1>=0:security/p5-Digest-SHA1 \
		p5-URI>=0:net/p5-URI

RUN_DEPENDS=	${BUILD_DEPENDS}

MAKE_JOBS_UNSAFE=	yes

PERL_CONFIGURE=	yes

MAKE_ARGS+=	PERLPREFIX=${PREFIX}
USES=		tar:bzip2

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${PERL} -pi -e 's|/etc/razor|${PREFIX}/etc|g'
	@${PERL} -pi -e 's,share/man,man,g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
