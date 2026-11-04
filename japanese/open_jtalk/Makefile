PORTNAME=	open_jtalk
PORTVERSION=	1.11
CATEGORIES=	japanese audio
MASTER_SITES=	SOURCEFORGE
MASTER_SITE_SUBDIR=	open-jtalk/Open%20JTalk/open_jtalk-${PORTVERSION}
PKGNAMEPREFIX=	ja-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese Text-to-speech system using HTS-engine and Mecab
WWW=		http://open-jtalk.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PREFIX}/include/iconv.h:converters/libiconv \
		${PREFIX}/lib/libHTSEngine.a:audio/hts_engine-API

USE_CXXSTD=	c++14

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/AUTHORS   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/COPYING   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/ChangeLog ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/INSTALL   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/NEWS      ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README    ${DOCSDIR}

.include <bsd.port.mk>
