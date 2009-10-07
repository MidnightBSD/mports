# $MidnightBSD: mports/devel/p5-DateTime/Makefile,v 1.1 2009/03/21 15:37:56 laffer1 Exp $

PORTNAME=	DateTime
PORTVERSION=	0.50
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A date and time object
LICENSE=	perl

RUN_DEPENDS=	\
		${SITE_PERL}/${PERL_ARCH}/Params/Validate.pm:${PORTSDIR}/devel/p5-Params-Validate \
		${SITE_PERL}/DateTime/TimeZone.pm:${PORTSDIR}/devel/p5-DateTime-TimeZone \
		${SITE_PERL}/DateTime/Locale.pm:${PORTSDIR}/devel/p5-DateTime-Locale \
		${SITE_PERL}/Time/Local.pm:${PORTSDIR}/devel/p5-Time-Local
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		DateTime.3 DateTime::Duration.3 \
		DateTime::Helpers.3 DateTime::Infinite.3 DateTime::LeapSecond.3

.if !defined(NOPORTDOCS)
PORTDOCS=	CREDITS Changes TODO

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
