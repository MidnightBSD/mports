PORTNAME=	Locale-gettext
PORTVERSION=	1.07
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:C/.*-//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Message handling functions
WWW=		https://metacpan.org/release/gettext

LICENSE=	artistic gpl2
LICENSE_COMB=	dual

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CONFIGURE_ENV+=	LOCALBASE=${LOCALBASE}
USES=		gettext perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Locale/gettext/gettext.so

.include <bsd.port.mk>
