# $MidnightBSD$

PORTNAME=	flite
PORTVERSION=	1.4
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://www.speech.cs.cmu.edu/flite/packed/${PORTNAME}-${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-release

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small run-time speech synthesis engine
LICENSE=	agg
# core is BSDL, with GPL build system

FAKE_OPTS=	prefixhack

OPTIONS_DEFINE=	DOCS

USES=		cpe gmake tar:bzip2
CPE_VENDOR=	cmu
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared=yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-pd|-pR|g' ${WRKSRC}/main/Makefile

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${STRIP_CMD} ${PREFIX}/bin/* ${PREFIX}/lib/*.so

.include <bsd.port.mk>
