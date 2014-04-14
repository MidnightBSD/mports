# $MidnightBSD$

PORTNAME=	razor-agents
PORTVERSION=	2.85
CATEGORIES=	mail
MASTER_SITES=	SF/razor/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A distributed, collaborative, spam detection and filtering network

LICENSE=	artistic2

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/${PERL_ARCH}/Digest/SHA1.pm:${PORTSDIR}/security/p5-Digest-SHA1 \
		${SITE_PERL}/URI/Escape.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

MAKE_JOBS_UNSAFE=	yes

PERL_CONFIGURE=	yes

MAKE_ARGS+=	PERLPREFIX=${PREFIX}
USES=		tar:bzip2

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${PERL} -pi -e 's|/etc/razor|${PREFIX}/etc|g'
	@${PERL} -pi -e 's,share/man,man,g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
