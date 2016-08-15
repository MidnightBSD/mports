# $MidnightBSD$

PORTNAME=	szip
PORTVERSION=	2.1
CATEGORIES=	science archivers
MASTER_SITES=	http://www.hdfgroup.org/ftp/lib-external/${PORTNAME}/${PORTVERSION}/src/:src \
		http://www.hdfgroup.org/doc_resource/SZIP/:doc \
		FREEBSD_LOCAL/sunpoet:src,doc
PKGNAMEPREFIX=	hdf-
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:src \
		${PORTDOCS}:doc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lossless compression library for scientific data

LICENSE=	other

OPTIONS_DEFINE=	DOCS

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LIBS+=		-lm
USE_LDCONFIG=	yes
USES=		libtool

PORTDOCS=	Release_notes_2_0.pdf

post-install:
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${DISTDIR}/${PORTDOCS} ${DOCSDIR}/

regression-test test: build
	cd ${WRKSRC}/ && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
