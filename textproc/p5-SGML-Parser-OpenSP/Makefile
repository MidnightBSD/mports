# $MidnightBSD$

PORTNAME=	SGML-Parser-OpenSP
PORTVERSION=	0.994
PORTREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse SGML documents using OpenSP

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	onsgmls:textproc/opensp \
		p5-Class-Accessor>=0:devel/p5-Class-Accessor \
		p5-Test-Exception>=0:devel/p5-Test-Exception
RUN_DEPENDS:=	${BUILD_DEPENDS}


USES=		perl5
USE_DOS2UNIX=	yes
USE_PERL5=	configure
CC=		${CXX}
CONFIGURE_ARGS+="INC=-I${LOCALBASE}/include"

post-patch:
	(cd ${WRKSRC} ; \
	 ${REINPLACE_CMD} "s|%%LOCALBASE%%|${LOCALBASE}|g" Makefile.PL )

.include <bsd.port.mk>
