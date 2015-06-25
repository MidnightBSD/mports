# New ports collection makefile for:	p5-Net-Libdnet
# Date created:		May 8 2008
# Whom:			Lucas Holt <luke@Midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	Net-Libdnet
PORTVERSION=	0.98
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libdnet interface

LICENSE=	bsd3

BUILD_DEPENDS=	p5-Class-Gomor>=0:${PORTSDIR}/devel/p5-Class-Gomor
LIB_DEPENDS=	libdnet.so:${PORTSDIR}/net/libdnet
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	INC='-I${LOCALBASE}/include'
USES=		perl5
USE_PERL5=	configure

post-patch:
	@${REINPLACE_CMD} -e 's|dumbnet|dnet|g' ${WRKSRC}/Libdnet.xs

post-install:
	${CHMOD} u+w ${PREFIX}/${SITE_ARCH_REL}/auto/Net/Libdnet/Libdnet.so
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Net/Libdnet/Libdnet.so
	${CHMOD} u-w ${PREFIX}/${SITE_ARCH_REL}/auto/Net/Libdnet/Libdnet.so

.include <bsd.port.mk>
