PORTNAME=	modernish
DISTVERSIONPREFIX=	v
DISTVERSION=	0.16.5
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POSIX shell feature detection and language extension library
WWW=		https://github.com/modernish/modernish

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	cd ${WRKSRC} && \
	${SETENV} ${MAKE_ENV} GIT_CEILING_DIRECTORIES=${WRKDIR} script -q /dev/stdout \
		${SH} -x ./install.sh -d ${TRUE_PREFIX} -D ${FAKE_DESTDIR} -n -f -s ${SH}

	${RM} ${DOCSDIR}/LICENSE
	${MKDIR} ${EXAMPLESDIR:H}
	${MV} ${DOCSDIR}/examples ${EXAMPLESDIR}
	${RLN} ${EXAMPLESDIR} ${DOCSDIR}/examples

.include <bsd.port.mk>
