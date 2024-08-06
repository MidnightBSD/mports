PORTNAME=	trivy
DISTVERSIONPREFIX=	v
DISTVERSION=	0.53.0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Security scanner written in go
WWW=		https://github.com/aquasecurity/trivy

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules,1.22

GO_MODULE=	github.com/aquasecurity/trivy
GO_TARGET=	./cmd/trivy
GO_BUILDFLAGS= -ldflags=" \
		-extldflags '-static' \
		-X github.com/aquasecurity/trivy/pkg/version.ver=${DISTVERSION} \
		-s -w"

PLIST_FILES=	bin/${PORTNAME}

NO_TEST=	yes

post-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/contrib/*.tpl ${DATADIR}/
	${FIND} -s ${STAGEDIR}${DATADIR} -not -type d | ${SORT} | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/##' | \
		${SED} -E -e '/sample$$/ s#^#@sample #; \
		s#${DATADIR_REL}/bin#@(,,555) ${DATADIR_REL}/bin#; ' >> ${TMPPLIST}
	cat ${TMPPLIST}

.include <bsd.port.mk>
