# $MidnightBSD$

PORTNAME=	Pod-Parser
PORTVERSION=	1.38
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Pod
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules to work with POD (Plain Old Documentation)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Pod::Checker.3 Pod::Find.3 Pod::InputObjects.3 \
		Pod::ParseUtils.3 Pod::Parser.3 Pod::PlainText.3 Pod::Select.3 \
		Pod::Usage.3

post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL
	@${FIND} ${WRKSRC} -name \*.orig -exec ${RM} {} \;

.include <bsd.port.mk>
