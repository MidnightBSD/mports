# $MidnightBSD: mports/mail/razor-agents/Makefile,v 1.5 2009/10/27 04:09:52 laffer1 Exp $

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
USE_BZIP2=	yes

MAN1=		razor-revoke.1 razor-admin.1 razor-report.1 razor-check.1
MAN3=		Razor2::Errorhandler.3 Razor2::Preproc::deHTMLxs.3 \
		Razor2::Syslog.3
MAN5=		razor-agents.5 razor-whitelist.5 razor-agent.conf.5

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${PERL} -pi -e 's|/etc/razor|${PREFIX}/etc|g'
	@${PERL} -pi -e 's,share/man,man,g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
