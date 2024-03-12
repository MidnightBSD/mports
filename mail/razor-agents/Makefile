PORTNAME=	razor-agents
PORTVERSION=	2.85
PORTREVISION=	3
CATEGORIES=	mail
MASTER_SITES=	SF/razor/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed, collaborative, spam detection and filtering network
WWW=		https://sourceforge.net/projects/razor/

LICENSE=	artistic2

BUILD_DEPENDS=	p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-Digest-SHA1>=0:security/p5-Digest-SHA1 \
		p5-URI>=0:net/p5-URI

RUN_DEPENDS=	${BUILD_DEPENDS}

MAKE_ARGS+=	PERLPREFIX=${PREFIX}
USES=		perl5 shebangfix tar:bzip2
USE_PERL5=	configure patch

SHEBANG_FILES=	lib/Razor2/Client/*.pm \
		lib/Razor2/Signature/*.pm \
		lib/Razor2/*.pm

MAKE_JOBS_UNSAFE=	yes

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${PERL} -pi -e 's|/etc/razor|${PREFIX}/etc|g'
	@${REINPLACE_CMD} -e '/MAN5/s,man/man5,${SITE_MAN3_REL:S/3/5/},g' ${WRKSRC}/${CONFIGURE_SCRIPT}
#	@${PERL} -pi -e 's,share/man,man,g' ${WRKSRC}/${CONFIGURE_SCRIPT}

post-fake:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${SITE_PERL}/${PERL_ARCH}/auto/razor-agents/.packlist

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${TRUE_PREFIX}/${SITE_ARCH_REL}/auto/Razor2/Preproc/deHTMLxs/deHTMLxs.so

.include <bsd.port.mk>
