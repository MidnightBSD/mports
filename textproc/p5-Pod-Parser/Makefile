# Created by: Sergey Skvortsov <skv@FreeBSD.org>

PORTNAME=	Pod-Parser
PORTVERSION=	1.63
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules to work with POD (Plain Old Documentation)

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5 dos2unix
USE_PERL5=	configure

post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
