# $MidnightBSD$

PORTNAME=	razor-agents
PORTVERSION=	2.85
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITES=	SF/razor/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed, collaborative, spam detection and filtering network

LICENSE=	artistic2

BUILD_DEPENDS=	p5-Net-DNS>=0:${PORTSDIR}/dns/p5-Net-DNS \
		p5-Digest-SHA1>=0:${PORTSDIR}/security/p5-Digest-SHA1 \
		p5-URI>=0:${PORTSDIR}/net/p5-URI

RUN_DEPENDS=	${BUILD_DEPENDS}

MAKE_JOBS_UNSAFE=	yes

MAKE_ARGS+=	PERLPREFIX=${PREFIX}
USES=		tar:bzip2 perl5
USE_PERL5=	configure

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${PERL} -pi -e 's|/etc/razor|${PREFIX}/etc|g'
	@${REINPLACE_CMD} -e '/MAN5/s,man/man5,${SITE_MAN3_REL:S/3/5/},g' ${WRKSRC}/${CONFIGURE_SCRIPT}
#	@${PERL} -pi -e 's,share/man,man,g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
